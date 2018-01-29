use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# AppWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :candidate_website, CandidateWebsite.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "jd-website.gigalixirapp.com", port: 4000],
  check_origin: [
    "jd-website.gigalixirapp.com"
  ],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  server: true

# Do not print debug messages in production
config :logger, level: :info

config :candidate_website,
  script_src: ~s(<script src="/js/app.js"></script>),
  css_src: ~s(<link rel="stylesheet" href="/css/app.css" media="screen,projection" />)

config :actionkit,
  base: "${AK_BASE}",
  username: "${AK_USERNAME}",
  password: "${AK_PASSWORD}"

config :candidate_website,
  proxy_base_url: "${PROXY_BASE_URL}",
  proxy_secret: "${PROXY_SECRET}"
