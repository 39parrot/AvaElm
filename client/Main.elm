import PersonGrid exposing (init, update, view)
import StartApp exposing (start)
import Task exposing (..)
import Effects exposing (Never)

app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = []
    }


main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
