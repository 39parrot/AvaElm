module Person (Model, Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)

-- MODEL

type alias Model = {
  imageUrl : String
}


-- UPDATE

type Action = Click

update : Action -> Model -> Model
update action model = model

-- VIEW

(=>) = (,)

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ style
      [ "width" => "150px"
      , "height" => "150px"
      , "border-radius" => "75px"
      , "background-image" => ("url('" ++ model.imageUrl ++ "')")
      ]
    ]
    []
