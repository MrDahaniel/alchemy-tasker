defmodule AlchemyTasker.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()

    has_many :tasklists, AlchemyTasker.Tasklist
  end

  @doc false
  # Basic changeset for name, username and email, verifies username lenght and email format
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
    |> validate_length(:name, min: 1, max: 50)
    |> validate_length(:username, min: 4, max: 20)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
