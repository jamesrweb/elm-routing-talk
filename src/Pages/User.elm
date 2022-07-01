module Pages.User exposing (User(..), Username(..), view, toUser)

import Elements.ChunkyText
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
    recase ToTitle username
        |> (++) "User: "
        |> Elements.ChunkyText.view
