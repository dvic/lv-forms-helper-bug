# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :forms_demo,
  ecto_repos: [FormsDemo.Repo]

# Configures the endpoint
config :forms_demo, FormsDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gEFLuD7I1U51X4gi0y1avyg1rUK6NfXpMVBKgOxVx1XFpP9n97W8YqPBYF4AZD3Z",
  render_errors: [view: FormsDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FormsDemo.PubSub,
  live_view: [signing_salt: "iNvr3GsT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
