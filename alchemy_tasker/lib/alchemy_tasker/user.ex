defmodule AlchemyTasker.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :login_token, :string

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
    |> validate_format(:email, ~r/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)
    |> unique_constraint(:username, name: :users_lower_username_index)
    |> unique_constraint(:email, name: :users_lower_email_index)
    |> cast(attrs, [:password])
    |> validate_length(:password, min: 8, max: 20)
  end

  defp hash_pass(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
  end

  defp hash_pass(changeset) do
    changeset
  end

  def registration_changeset(user, attrs) do
    user 
    |> changeset(attrs)
    |> validate_required(:password)
    |> hash_pass
  end

  def verify_user(%AlchemyTasker.User{} = user, input_password) do
    Argon2.verify_pass(user, input_password)
  end

end
