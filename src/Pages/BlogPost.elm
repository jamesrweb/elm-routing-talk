module Pages.BlogPost exposing (BlogPostId(..), view)

import Html exposing (Html)
import ReCase exposing (ReCase(..), recase)


type BlogPostId
    = BlogPostId Int


view : BlogPostId -> Html msg
view (BlogPostId blogPostId) =
    Html.h1 [] [ "Topic: " ++ recase ToTitle (String.fromInt blogPostId) ++ "." |> Html.text ]
