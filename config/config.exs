# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ultrablog,
  ecto_repos: [Ultrablog.Repo]

# Configures the endpoint
config :ultrablog, UltrablogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lqbW1hRG1fPsHL1hCf6tTqgeLRYJKwMUrrOIzILox//pymTVHOdWKe+nRhUC26Aw",
  render_errors: [view: UltrablogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ultrablog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
