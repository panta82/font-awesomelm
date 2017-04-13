module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onInput )

import Components.Icon exposing ( .. )


-- APP
main : Program (List String) Model Msg
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

init : List String -> (Model, Cmd Msg)
init rawKeys = (
    {
      icons = loadIcons rawKeys,
      filter = ""
    },
    Cmd.none
  )


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- UPDATE
type Msg =
  SetFilter String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SetFilter filter ->
      ({ model | filter = filter }, Cmd.none)


-- VIEW
view : Model -> Html Msg
view model =
  div [] [
    div [ class "navbar navbar-default navbar-static-top" ] [
      div [ class "container" ] [
        div [ class "navbar-header"] [
          span [ class "navbar-brand" ] [
            text "Font Awesomelm"
          ]
        ],
        Html.form [ class "navbar-form navbar-right filter-form" ] [
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
