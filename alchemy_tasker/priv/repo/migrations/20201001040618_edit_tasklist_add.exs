defmodule AlchemyTasker.Repo.Migrations.EditTasklistAdd do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        add :finished_tasks, references(:tasks)
        add :unfinished_tasks, references(:tasks)
    end
  end
end
