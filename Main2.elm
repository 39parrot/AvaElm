import Person exposing (..)
import PersonGrid exposing (..)
import StartApp.Simple exposing (start)

main =
  start
    { model = PersonGrid.init
    , update = PersonGrid.update
    , view = PersonGrid.view
    }

-- main =
--   start
--     { model = Person.Model "/avatar/alex.jpg"
--     , update = Person.update
--     , view = Person.view
--     }
