defmodule AlchemyTasker.Repo.Migrations.AddUserIdToTasklist do
  use Ecto.Migration

  def change do
    alter table(:tasklists) do
        add :user_id, references(:users)
    end
  end
end
