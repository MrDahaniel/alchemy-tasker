defmodule AlchemyTasker.Tasklist do
  use Ecto.Schema
  import Ecto.Changeset
  import AlchemyTasker.AuxiliaryFunctions

  schema "tasklists" do
    field :description, :string
    field :name, :string
    field :tags, {:array, :string}

    timestamps()

    belongs_to :user, AlchemyTasker.User 

    has_many :tasks, AlchemyTasker.Task
  end

  @doc false
  def changeset(tasklist, attrs) do
    tasklist
    |> cast(attrs, [:name, :tags, :description, :user_id])
    |> validate_required([:name, :user_id])
    |> validate_length(:name, max: 55)
    |> validate_length(:tags, max: 15)
    |> assoc_constraint(:user)
  end
end
