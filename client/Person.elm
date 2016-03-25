module Person (Model, Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Debug exposing (log)

-- MODEL

type alias Model =
  { imageUrl : String
  , active : Bool
  }


-- UPDATE

type Action = Click | Activate | Deactivate

update : Action -> Model -> Model
update action model =
  case action of
    Click ->
      if model.active then
        update Deactivate model
      else
        update Activate model
    Activate ->
      { model | active = True }
    Deactivate ->
      { model | active = False }

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
      , "opacity" => if model.active then "1" else "0.5"
      ]
    , onClick address Click
    ]
    []
