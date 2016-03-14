module PersonGrid where

import Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (style)

-- MODEL

type alias PersonId = Int

type alias Model = List (PersonId, Person.Model)

init : Model
init =
  [ (1, Person.Model "public/assets/avatar/alex.jpg" True)
  , (2, Person.Model "public/assets/avatar/dmitry.jpg" True)
  , (3, Person.Model "public/assets/avatar/ivan.jpg" True)
  , (4, Person.Model "public/assets/avatar/macaw.jpg" True)
  ]

-- UPDATE

type Action = PersonAction PersonId Person.Action

update : Action -> Model -> Model
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
      List.map updatePerson model

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
    (List.map (viewPerson address) model)

viewPerson : Signal.Address Action -> (PersonId, Person.Model) -> Html
viewPerson address (iPersonId, iPersonModel) =
  div
    [ style
      [ "margin" => "auto" ]
    ]
    [ Person.view (Signal.forwardTo address (PersonAction iPersonId)) iPersonModel ]
