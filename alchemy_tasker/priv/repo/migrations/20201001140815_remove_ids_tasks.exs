defmodule AlchemyTasker.Repo.Migrations.RemoveIdsTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
        remove :finished_id
        remove :unfinished_id
    end
  end
end
