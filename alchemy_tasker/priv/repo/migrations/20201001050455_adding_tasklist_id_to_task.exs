defmodule AlchemyTasker.Repo.Migrations.AddingTasklistIdToTask do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
        add :tasklist_id, references(:tasklists)
    end
  end
end
