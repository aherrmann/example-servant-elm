module Tests exposing (tests)

import App exposing (FromUi(..), init, update)
import Expect
import Test exposing (..)


tests : Test
tests =
    describe "client test suite"
        [ test "clean add item field on AddItemButton" <|
            \_ ->
                let
                    model =
                        Tuple.first init

                    ( updatedModel, _ ) =
                        { model | addItemInput = "foo" }
                            |> update (App.FromUi AddItemButton)
                in
                updatedModel.addItemInput
                    |> Expect.equal ""
        ]
