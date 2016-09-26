require 'raven'

Raven.configure do |config|
  config.dsn = Rails.application.secrets[:sentry_dsn]
  # config.ssl_verification = false
end
