import Browser
import Html exposing (Html, button, div, span, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, attribute)

----------------------------------------------------------------------------------------------------

main = Browser.sandbox { init = init, update = update, view = view }

----------------------------------------------------------------------------------------------------

type alias Data = { counter : Int }

init = Data 0

----------------------------------------------------------------------------------------------------

type Action = Increment | Decrement

update action data =
    case action of
        Increment -> { data | counter = data.counter + 1 }
        Decrement -> { data | counter = data.counter - 1 }

----------------------------------------------------------------------------------------------------

view data =
    div [ class "counter" ] [
        button [ onClick Decrement, attribute "style" buttonStyle ] [ text "-" ],
        span [ attribute "style" numberStyle ] [ text (String.fromInt data.counter) ],
        button [ onClick Increment, attribute "style" buttonStyle ] [ text "+" ]
    ]

numberStyle = "padding:10px 20px 10px 20px; border: 1px solid #eee"
buttonStyle = "padding:10px 20px 10px 20px; border: 1px solid #eee; cursor: pointer"
