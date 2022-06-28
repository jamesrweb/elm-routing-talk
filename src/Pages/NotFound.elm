module Pages.NotFound exposing (..)

import Html exposing (Html)


view : Html msg
view =
    Html.h1 [] [ Html.text "404: NotFound" ]
