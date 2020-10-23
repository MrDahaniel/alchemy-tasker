defmodule AlchemyTaskerWeb.UserController do
    use AlchemyTaskerWeb, :controller

    def new(conn, _params) do
        changeset = AlchemyTasker.User.registration_changeset(%AlchemyTasker.User{}, %{})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        changeset = AlchemyTasker.User.registration_changeset(%AlchemyTasker.User{}, user_params)
        case AlchemyTasker.Repo.insert(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: Routes.page_path(conn, :index))
            {:error, changeset} -> 
                render(conn, "new.html", changeset: changeset)
        end
    end

    def user(_conn, _params) do
        :ok
    end
end