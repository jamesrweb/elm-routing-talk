module Pages.Topic exposing (Topic(..), view)

import Html exposing (Html)
import ReCase exposing (ReCase(..), recase)


type Topic
    = Topic String


view : Topic -> Html msg
view (Topic topic) =
    Html.h1 [] [ "Topic: " ++ recase ToTitle topic ++ "." |> Html.text ]
