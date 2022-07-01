module Pages.BlogPost exposing (BlogPostId(..), view)

import Elements.ChunkyText
import Html exposing (Html)
import ReCase exposing (ReCase(..), recase)


type BlogPostId
    = BlogPostId Int


view : BlogPostId -> Html msg
view (BlogPostId blogPostId) =
    String.fromInt blogPostId
        |> recase ToTitle
        |> (++) "Blog post ID: "
        |> Elements.ChunkyText.view
