defmodule AlchemyTasker.Tasklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasklists" do
    field :description, :string
    field :name, :string
    field :tags, {:array, :string}
    has_many :finished_task, AlchemyTasker.Task
    has_many :unfinished_task, AlchemyTasker.Task

    timestamps()
  end

  @doc false
  def changeset(tasklist, attrs) do
    tasklist
    |> cast(attrs, [:name, :tags, :description])
    |> validate_required([:name, :tags, :description])
  end
end
