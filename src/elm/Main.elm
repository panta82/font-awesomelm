port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onInput )

import Msg exposing (..)
import Components.Icon exposing ( .. )


-- APP
main : Program String Model Msg
main =
  Html.programWithFlags {
    view = view,
    update = update,
    init = init,
    subscriptions = subscriptions
  }


-- MODEL
type alias Model = {
  icons: List Icon,
  filter: String
}

init : String -> (Model, Cmd Msg)
init faVarsTxt = (
    {
      icons = loadIcons faVarsTxt,
      filter = ""
    },
    Cmd.none
  )


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- PORTS
port copyToClipboard : String -> Cmd msg


-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SetFilter filter ->
      ({ model | filter = filter }, Cmd.none)
    
    CopyToClipboard selector ->
      (model, copyToClipboard selector)


-- VIEW
view : Model -> Html Msg
view model =
  div [] [
    div [ class "toolbar" ] [
      div [ class "container" ] [
        span [ class "site-title" ] [
          text "F"
        ],
        Html.form [ class "filter-form" ] [
          div [ class "form-group" ] [
            input [ placeholder "Filter", onInput SetFilter, class "form-control"] []
          ]
        ]
      ]
    ],
    div [ class "container" ] [
      div [ class "row" ] [
        div [ class "col-xs-12" ] [
          renderIconList model.icons model.filter
        ]
      ]
    ]
  ]
