import Html exposing (..)
import Html.Attributes exposing (..)

(=>) = (,)

main =
  div
    [ containerStyle]
    [ div [itemStyle "/avatar/alex.jpg"]    []
    , div [itemStyle "/avatar/dmitry.jpg"]  []
    , div [itemStyle "/avatar/ivan.jpg"]    []
    , div [itemStyle "/avatar/macaw.jpg"]   []
    , div [itemStyle "/avatar/macaw.jpg"]   []
    , div [itemStyle "/avatar/macaw.jpg"]   []
    ]
 
containerStyle =
  style 
    [ "backgroundColor" => "purple"
    , "height" => "100vh"
    , "display" => "flex"
    , "flex-flow" => "row wrap"
    ]
 
itemStyle url =
  style
    [ "width" => "150px"
    , "height" => "150px"
    , "border-radius" => "75px"
    , "backgroundColor" => "yellow"
    , "margin" => "auto"
    , "background-image" => ("url('" ++ url ++ "')")
    ]
    
    
    