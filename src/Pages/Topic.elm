module Pages.Topic exposing (Topic(..), view)

import Elements.ChunkyText
import Html exposing (Html)
import ReCase exposing (ReCase(..), recase)


type Topic
    = Topic String


view : Topic -> Html msg
view (Topic topic) =
    recase ToTitle topic
        |> (++) "Topic: "
        |> Elements.ChunkyText.view
