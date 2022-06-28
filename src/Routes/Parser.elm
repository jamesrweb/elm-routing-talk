module Routes.Parser exposing (Route(..), fromUrl)

import Pages.BlogPost exposing (BlogPostId(..))
import Pages.Comment exposing (CommentId(..))
import Pages.Topic exposing (Topic(..))
import Pages.User exposing (User, toUser)
import Url exposing (Url)
import Url.Parser as UP exposing ((</>), Parser)


type Route
    = HomeRoute
    | TopicRoute Topic
    | BlogRoute BlogPostId
    | UserRoute User
    | CommentRoute User CommentId
    | NotFoundRoute


userRouteParser : Parser (User -> b) b
userRouteParser =
    UP.custom "USER" <| \segment -> toUser segment |> Just


blogPostIdRouteParser : Parser (BlogPostId -> b) b
blogPostIdRouteParser =
    UP.custom "BLOG POST ID" <|
        \segment ->
            String.toInt segment |> Maybe.map (\id -> BlogPostId id)


commentIdRouteParser : Parser (CommentId -> b) b
commentIdRouteParser =
    UP.custom "COMMENT ID" <|
        \segment ->
            String.toInt segment |> Maybe.map (\id -> CommentId id)


topicParser : Parser (Topic -> b) b
topicParser =
    UP.custom "TOPIC NAME" <| \segment -> Topic segment |> Just


routeParser : Parser (Route -> a) a
routeParser =
    UP.oneOf
        [ UP.map HomeRoute UP.top
        , UP.map TopicRoute (UP.s "topic" </> topicParser)
        , UP.map BlogRoute (UP.s "blog" </> blogPostIdRouteParser)
        , UP.map UserRoute (UP.s "user" </> userRouteParser)
        , UP.map CommentRoute (UP.s "user" </> userRouteParser </> UP.s "comment" </> commentIdRouteParser)
        ]


fromUrl : Url -> Route
fromUrl url =
    UP.parse routeParser url |> Maybe.withDefault NotFoundRoute
