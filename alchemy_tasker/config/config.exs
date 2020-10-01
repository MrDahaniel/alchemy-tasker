# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :alchemy_tasker,
  ecto_repos: [AlchemyTasker.Repo]

# Configures the endpoint
config :alchemy_tasker, AlchemyTaskerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ihCyKYhb3lzIB3X89nOcOnuPrpPnLDSc6cW+nqBhgpOVQV8uggUzo8vpe9EsY5tJ",
  render_errors: [view: AlchemyTaskerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AlchemyTasker.PubSub,
  live_view: [signing_salt: "2zZLRkdo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
