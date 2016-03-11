module PersonGrid where

import Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (style)

-- MODEL

type alias Model = List Person.Model

init : Model
init =
  [ Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  , Person.Model "/avatar/alex.jpg"
  ]

-- UPDATE

update : action -> Model -> Model
update action model = model

-- VIEW

(=>) = (,)

view : Signal.Address () -> Model -> Html
view address model =
  div -- flex container
    [ style
      [ "backgroundColor" => "purple"
      , "height" => "100vh"
      , "display" => "flex"
      , "flex-flow" => "row wrap"
      ]
    ]
    -- flex items
    (List.map (viewPerson address) model)

viewPerson : Signal.Address () -> Person.Model -> Html
viewPerson address personModel =
  div
    [ style
      [ "margin" => "auto" ]
    ]
    [ Person.view (Signal.forwardTo address (\personAction -> ())) personModel ]
