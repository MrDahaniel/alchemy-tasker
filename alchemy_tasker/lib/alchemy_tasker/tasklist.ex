defmodule AlchemyTasker.Tasklist do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:name, :tags, :description])
    |> validate_required([:name])
  end
end
