module Pages.User exposing (..)

import Html exposing (Html)
import ReCase exposing (ReCase(..), recase)


type Username
    = Username String


type User
    = User Username


toUser : String -> User
toUser username =
    Username username |> User


view : User -> Html msg
view (User (Username username)) =
    Html.h1 [] [ "User: " ++ recase ToTitle username ++ "." |> Html.text ]
