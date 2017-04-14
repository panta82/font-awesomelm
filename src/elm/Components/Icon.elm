module Components.Icon exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )
import String
import Regex

import Msg exposing (..)

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
      , name = String.join " " tokens
      , class = "fa-" ++ String.join "-" tokens
      }
  )

renderIcon : Icon -> Html Msg
renderIcon icon =
  span [ class ("icon-" ++ icon.class) ] [
    i [ class ("fa " ++ icon.class) ] [],
    span [ onClick (CopyToClipboard icon.class) ] [
      text icon.class
    ]
  ]

renderIconList: List Icon -> String -> Html Msg
renderIconList icons filter =
  let
    filterRegex = Regex.regex filter
    items = icons
      |> List.filter (\icon -> Regex.contains filterRegex icon.name)
      |> List.map (\icon -> li [] [ renderIcon icon ])
  in
    ul [] items
