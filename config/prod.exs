use Mix.Config

config :deployable, Deployable.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version],
  secret_key_base: "${SECRET_KEY_BASE}"

config :deployable,
  secret: "${SECRET}"

# Do not print debug messages in production
config :logger, level: :info
