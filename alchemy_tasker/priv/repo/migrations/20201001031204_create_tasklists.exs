defmodule AlchemyTasker.Repo.Migrations.CreateTasklists do
  use Ecto.Migration

  def change do
    create table(:tasklists) do
      add :name, :string
      add :tags, {:array, :string}
      add :description, :string

      timestamps()
    end

  end
end
