module Pages.Comment exposing (CommentId(..), view)

import Elements.ChunkyText
import Html exposing (Html)
import Pages.User exposing (User(..), Username(..))
import ReCase exposing (ReCase(..), recase)


type CommentId
    = CommentId Int


view : User -> CommentId -> Html msg
view (User (Username username)) (CommentId commentId) =
    Html.div []
        [ recase ToTitle username
            |> (++) "User: "
            |> Elements.ChunkyText.view
        , String.fromInt commentId
            |> (++) "Comment ID: "
            |> Elements.ChunkyText.view
        ]
