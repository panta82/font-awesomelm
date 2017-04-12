module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- hello component
hello : Int -> Html a
hello model =
  let
    chars =
      List.repeat model (i [ class "fa fa-times" ] [])
  in
    div [] [
      h1 [] (List.concat [[ text "Hello, Elm" ], chars])
    ]

