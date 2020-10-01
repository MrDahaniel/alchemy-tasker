defmodule AlchemyTasker.Repo.Migrations.FixingThings do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        remove :finished_id
        remove :unfinished_id
    end
  end
end
