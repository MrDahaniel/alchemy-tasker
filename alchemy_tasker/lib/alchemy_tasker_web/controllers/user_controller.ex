defmodule AlchemyTaskerWeb.UserController do
    use AlchemyTaskerWeb, :controller

    def register(_conn, _params) do
        :nothing
    end

    def user(_conn, _params) do

    end

    def login(conn, %{"user" => user_params}) do
        changeset = AlchemyTasker.User.registration_changeset(%AlchemyTasker.User{}, user_params)
        case AlchemyTasker.Repo.insert!(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "#{user.name} registered!")
                |> redirect(to: Routes.user_path(conn, :index))
            {:error, changeset} ->
                render(conn, "", changeset: changeset)
        end
    end
end
