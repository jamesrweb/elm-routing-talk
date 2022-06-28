module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Elements.Navigation
import Elements.UrlDebugger
import Html exposing (Html)
import Pages.BlogPost
import Pages.Comment
import Pages.Home
import Pages.NotFound
import Pages.Topic
import Pages.User
import Routes.Parser exposing (Route(..), fromUrl)
import Url exposing (Url)



-- MAIN


type alias Flags =
    ()


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , route : Route
    , url : Url
    , title : String
    }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key, route = fromUrl url, url = url, title = "URL Interceptor" }, Cmd.none )



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Url.toString url |> Nav.pushUrl model.key )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | route = fromUrl url, url = url }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


contentForRoute : Route -> Html msg
contentForRoute route =
    case route of
        NotFoundRoute ->
            Pages.NotFound.view

        HomeRoute ->
            Pages.Home.view

        TopicRoute topic ->
            Pages.Topic.view topic

        BlogRoute blogPostId ->
            Pages.BlogPost.view blogPostId

        UserRoute user ->
            Pages.User.view user

        CommentRoute user comment ->
            Pages.Comment.view user comment


view : Model -> Browser.Document Msg
view model =
    { title = model.title
    , body =
        [ Elements.Navigation.view
        , Elements.UrlDebugger.view model.url
        , contentForRoute model.route
        ]
    }
