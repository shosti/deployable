# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :deployable, Deployable.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wiqeG7dae2o2w6Rt3K6s1IQDKCV1Jzom/zWu9ahFPkq7pn5JNvSaAke9hXg0gLWE",
  render_errors: [view: Deployable.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Deployable.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
