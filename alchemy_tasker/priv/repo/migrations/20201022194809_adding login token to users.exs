defmodule :"Elixir.AlchemyTasker.Repo.Migrations.Adding login token to users" do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  	  add :login_token, :string
  	end
  end
end
