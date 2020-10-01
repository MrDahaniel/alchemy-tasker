defmodule AlchemyTasker.Repo do
  use Ecto.Repo,
    otp_app: :alchemy_tasker,
    adapter: Ecto.Adapters.Postgres
end
