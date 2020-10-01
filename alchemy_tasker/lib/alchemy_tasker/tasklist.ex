defmodule AlchemyTasker.Tasklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasklists" do
    field :description, :string
    field :name, :string
    field :tags, {:array, :string}
    field :finished_id, :integer
    field :unfinished_id, :integer
    has_many :finished_task, AlchemyTasker.Task, foreign_key: :finished_id, references: :id
    has_many :unfinished_task, AlchemyTasker.Task, foreign_key: :unfinished_id, references: :id

    timestamps()
  end

  @doc false
  def changeset(tasklist, attrs) do
    tasklist
    |> cast(attrs, [:name, :tags, :description])
    |> validate_required([:name, :tags, :description])
  end
end
