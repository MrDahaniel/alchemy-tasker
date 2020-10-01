defmodule AlchemyTasker.Repo.Migrations.AddRelationshipTaskTasklist do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        add :task_id, references(:tasks)
    end
  end
end
