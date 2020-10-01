defmodule AlchemyTasker.Repo.Migrations.AddingToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
        add :finished_id, references(:tasklists)
        add :unfinished_id, references(:tasklists)        
    end
  end
end
