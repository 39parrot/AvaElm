module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

update model = model

view address model =
  div []
    [ button [] [ text "-" ], text (toString model), button [] [ text "+" ]]
