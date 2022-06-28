module Pages.Comment exposing (..)

import Html exposing (Html)
import Pages.User exposing (User(..), Username(..))
import ReCase exposing (ReCase(..), recase)


type CommentId
    = CommentId Int


view : User -> CommentId -> Html msg
view (User (Username username)) (CommentId commentId) =
    Html.h1 [] [ "User: " ++ recase ToTitle username ++ ". Comment ID: " ++ String.fromInt commentId ++ "." |> Html.text ]
