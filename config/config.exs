use Mix.Config

# General application configuration
config :candidate_website, ecto_repos: [Osdi.Repo]

# Configures the endpoint
config :candidate_website, CandidateWebsite.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bfsqn9AcIMywYeFfFrwwtpRis6Jda9AQdRrc20qyXzQlB4oBV/FA+Isy4jDAB77n",
  render_errors: [view: CandidateWebsite.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CandidateWebsite.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Cipher
config :cipher,
  keyphrase: "testiekeyphraseforcipher",
  ivphrase: "testieivphraseforcipher",
  magic_token: "magictoken"

# Cosmic
config :cosmic, slugs: ["justice-democrats"]

# Domains
config :candidate_website,
  domains: %{
    "www.justicedemocrats.com" => "justice-democrats",
    "justicedemocrats.com" => "justice-democrats"
  }

jobs =
  [
    {"*/2 * * * *", {CandidateWebsite.EventCache, :update, []}}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
