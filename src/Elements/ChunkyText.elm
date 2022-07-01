module Elements.ChunkyText exposing (view)

import Html exposing (Html)
import Html.Attributes as Attributes


view : String -> Html msg
view text =
    Html.strong
        [ Attributes.style "font-size" "3rem"
        , Attributes.style "display" "block"
        ]
        [ Html.text text ]
