module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.Hello exposing ( hello )


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

type alias Glyph = {
  name: String
}

type alias Model = {
  number: Int,
  items: List Glyph
}

init : List String -> (Model, Cmd Msg)
init glyphNames = (
    {
      number = 0,
      items = List.map (\x -> { name = x }) glyphNames
    },
    Cmd.none
  )


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)
    
    Increment -> (
      {
        model | number = model.number + 1
      },
      Cmd.none)


-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container" ] [
    div [ class "row" ] [
      div [ class "col-xs-12" ] [
        div [ class "jumbotron", style [("margin-top", "30px"), ( "text-align", "center" )] ] [
          img [ src "static/img/elm.jpg", style styles.img ] []
          , hello model.number
          , p [] [ text ( "Elm Webpack Starter" ) ]
          , button [ class "btn btn-primary btn-lg", onClick Increment ] [
            span[ class "fa fa-star" ] []
            , span[] [ text "FTW!" ]
          ]
        ]
        , div [] [
          ul [] (
            List.map (\glyph -> li [] [ text glyph.name ]) model.items
          )
        ]
      ]
    ]
  ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
