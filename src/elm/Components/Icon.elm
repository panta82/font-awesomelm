module Components.Icon exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )
import String
import Regex

import Msg exposing (..)

type alias Icon = {
  name: String,
  class: String
}

loadIcons : String -> List Icon
loadIcons faVarsTxt =
  faVarsTxt
  |> String.lines
  |> List.filter (String.startsWith "$fa-var-")
  |> List.map (\rawLine -> 
    let
      columnIndex = Maybe.withDefault -1 (String.indexes ":" rawLine |> List.head)
      dashedName = String.slice 8 columnIndex rawLine
    in
      { name = Regex.replace Regex.All (Regex.regex "\\-") (\_ -> "_") dashedName
      , class = "fa-" ++ dashedName
      }
  )

renderIcon : Icon -> Html Msg
renderIcon icon =
  div [ class "icon icon-" ++ icon.name ] [
    i [ class ("fa " ++ icon.class) ] [],
    div [] [
      span [ class "name" onClick (CopyToClipboard (".icon-" ++ icon.name ++ " .name")) ] [ text icon.name ],
      br [] [],
      span [ class "class-name" onClick (CopyToClipboard (".icon-" ++ icon.name ++ " .class-name")) ] [ text icon.class ]
    ]
  ]

renderIconList: List Icon -> String -> Html Msg
renderIconList icons filter =
  let
    filterTokens = Regex.split Regex.All (Regex.regex "[ _\\-.]+") filter
    filterRegex = Regex.regex (String.join "_" filterTokens)
    items = icons
      |> List.filter (\icon -> Regex.contains filterRegex icon.name)
      |> List.map (\icon -> li [] [ renderIcon icon ])
  in
    ul [ class "icons" ] items
