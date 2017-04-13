module Components.Icon exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String
import Regex

type alias Icon = {
  tokens: List String,
  name: String,
  class: String
}

loadIcons : List String -> List Icon
loadIcons rawKeys =
  rawKeys
  |> List.filter (String.startsWith "faVar")
  |> List.map (\rawKey -> 
    let
      rawTokens = String.dropLeft 5 rawKey
      matches = Regex.find Regex.All (Regex.regex "([A-Z0-9][a-z0-9]*)") rawTokens
      tokens = List.map (\m -> String.toLower m.match) matches
    in
      { tokens = tokens
      , name = String.join "_" tokens
      , class = "fa-" ++ String.join "-" tokens
      }
  )

renderIcon : Icon -> Html a
renderIcon icon =
  span [] [
    i [ class ("fa " ++ icon.class) ] [],
    span [] [
      text icon.class
    ]
  ]
