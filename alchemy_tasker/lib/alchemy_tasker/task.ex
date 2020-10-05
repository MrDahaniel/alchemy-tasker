defmodule AlchemyTasker.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :detail, :string
    field :status, :boolean
    field :completed_at, :naive_datetime  
    
    timestamps()

    belongs_to :tasklist, AlchemyTasker.Tasklist
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :detail, :completed_at])
    |> validate_required([:name])
  end

end
