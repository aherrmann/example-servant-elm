module Main exposing (main)

import App exposing (Model, Msg, init, update, view)
import Browser


main : Program () Model Msg
main =
    Browser.element
        { init = \() -> init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
