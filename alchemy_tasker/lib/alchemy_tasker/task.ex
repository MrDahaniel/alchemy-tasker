defmodule AlchemyTasker.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed_at, :naive_datetime
    field :detail, :string
    field :name, :string
    belongs_to :finished, AlchemyTasker.Tasklist
    belongs_to :unfinished, AlchemyTasker.Tasklist

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :detail, :completed_at])
    |> validate_required([:name, :detail, :completed_at])
  end
end
