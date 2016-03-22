module PersonGrid where

import Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (style)
import Http exposing (..)
import Task exposing (..)
import Effects exposing (..)
import Json.Decode as Json exposing (..)

-- MODEL

type alias PersonId = Int

type alias PersonList = List (PersonId, Person.Model)

type alias Model =
  { people: PersonList }

init : (Model, Effects Action)
init =
  ( { people = [] }
  , Http.get decodePeopleResponse "http://localhost:8001/people"
    |> Task.toMaybe
    |> Task.map PeopleResponse
    |> Effects.task
  )

-- UPDATE

type Action = PeopleResponse (Maybe PersonList) | PersonAction PersonId Person.Action

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    PersonAction personId personAction ->
      let
        updatePerson (iPersonId, iPersonModel) =
          if iPersonId == personId then
            (iPersonId, Person.update personAction iPersonModel)
          else
            (iPersonId, iPersonModel)
      in
        ( { model | people = List.map updatePerson model.people }
        , Effects.none
        )
    PeopleResponse maybePersonList ->
      ( { model | people = Maybe.withDefault [] maybePersonList}
      , Effects.none
      )

-- VIEW

(=>) = (,)

view : Signal.Address Action -> Model -> Html
view address model =
  div -- flex container
    [ style
      [ "backgroundImage" => "url(public/assets/background/background.jpg)"
      , "backgroundSize" => "cover"
      , "backgroundPosition" => "center"
      , "height" => "100vh"
      , "display" => "flex"
      , "flex-flow" => "row wrap"
      ]
    ]
    -- flex items
    (List.map (viewPerson address) model.people)

viewPerson : Signal.Address Action -> (PersonId, Person.Model) -> Html
viewPerson address (iPersonId, iPersonModel) =
  div
    [ style
      [ "margin" => "auto" ]
    ]
    [ Person.view (Signal.forwardTo address (PersonAction iPersonId)) iPersonModel ]

-- EFFECTS

type alias PersonRecord = { id: Int, src: String, active: Bool }

decodePeopleResponse: Json.Decoder PersonList
decodePeopleResponse =
  Json.object3 PersonRecord
    ("id" := Json.int)
    ("src" := Json.string)
    ("active" := Json.bool)
  |> Json.map (\obj3 -> (obj3.id, Person.Model obj3.src obj3.active))
  |> Json.list
