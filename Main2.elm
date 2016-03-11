import PersonGrid exposing (..)
import StartApp.Simple exposing (start)

main =
  start
    { model = PersonGrid.init
    , update = PersonGrid.update
    , view = PersonGrid.view
    }
