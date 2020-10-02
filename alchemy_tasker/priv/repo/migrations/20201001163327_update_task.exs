defmodule AlchemyTasker.Repo.Migrations.UpdateTask do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
        remove :unfinished_id
        add :status, :string
    end
  end
end
