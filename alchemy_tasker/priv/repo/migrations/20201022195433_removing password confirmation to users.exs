defmodule :"Elixir.AlchemyTasker.Repo.Migrations.Removing password confirmation to users" do
  use Ecto.Migration

  def change do
  	alter table (:users) do
  		remove :aux
  	end
  end
end
