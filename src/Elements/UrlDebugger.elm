module Elements.UrlDebugger exposing (..)

import Html exposing (Html)
import Url exposing (Url)


view : Url -> Html msg
view url =
    Html.output [] [ Html.text ("The current url is: " ++ Url.toString url) ]
