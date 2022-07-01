module Elements.UrlDebugger exposing (view)

import Html exposing (Html)
import Url exposing (Url)


view : Url -> Html msg
view url =
    Html.output []
        [ Url.toString url
            |> (++) "The current url is: "
            |> Html.text
        ]
