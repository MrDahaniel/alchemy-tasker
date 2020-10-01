defmodule AlchemyTasker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :detail, :string
      add :completed_at, :naive_datetime

      timestamps()
    end

  end
end
