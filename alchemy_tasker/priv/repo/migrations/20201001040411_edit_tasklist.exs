defmodule AlchemyTasker.Repo.Migrations.EditTasklist do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        remove :task_id
    end
  end
end
