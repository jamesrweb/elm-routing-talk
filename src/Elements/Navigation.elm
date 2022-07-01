module Elements.Navigation exposing (view)

import Html exposing (Html)
import Html.Attributes as Attributes


type UrlPath
    = UrlPath String


view : Html msg
view =
    Html.ul []
        [ UrlPath "/" |> navigationLink "Home"
        , UrlPath "/topic" |> navigationLink "Topics overview"
        , UrlPath "/topic/" |> navigationLink "Topics overview (2)"
        , UrlPath "/topic/pottery" |> navigationLink "Pottery topic"
        , UrlPath "/blog/42" |> navigationLink "Blog post 42"
        , UrlPath "/user/tom" |> navigationLink "Tom"
        , UrlPath "/user/bob/comment/42" |> navigationLink "Bobs 42nd comment"
        ]


navigationLink : String -> UrlPath -> Html msg
navigationLink content (UrlPath path) =
    Html.li []
        [ Html.a [ Attributes.href path ] [ Html.text content ]
        ]
