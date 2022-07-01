module Pages.NotFound exposing (view)

import Elements.ChunkyText
import Html exposing (Html)


view : Html msg
view =
    Elements.ChunkyText.view "404: NotFound"
