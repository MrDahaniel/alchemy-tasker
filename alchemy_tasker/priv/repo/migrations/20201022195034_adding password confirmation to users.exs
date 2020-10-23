defmodule :"Elixir.AlchemyTasker.Repo.Migrations.Adding password confirmation to users" do
  use Ecto.Migration

  def change do
  	alter table (:users) do
  	  add :aux, :string
  	end
  end
end
