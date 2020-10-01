defmodule AlchemyTasker.Repo.Migrations.EditTasklistRename do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        remove :finished_tasks
        remove :unfinished_tasks
        add :finished_id, references(:tasks)
        add :unfinished_id, references(:tasks)
    end
  end
end
