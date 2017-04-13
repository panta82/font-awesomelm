module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Events exposing ( onClick )

import Components.Icon exposing ( Icon, loadIcons, renderIcon )


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
  icons: List Icon
}

init : List String -> (Model, Cmd Msg)
init rawKeys = (
    {
      icons = loadIcons rawKeys
    },
    Cmd.none
  )


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- UPDATE
type Msg = NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)


-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container" ] [
    div [ class "row" ] [
      div [ class "col-xs-12" ] [
        ul [] (
          List.map (\icon -> li [] [ renderIcon icon ]) model.icons
        )
      ]
    ]
  ]
