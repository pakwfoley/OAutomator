require_relative 'boot'

require 'rails/all'
require 'dotenv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv.load(".env.#{Rails.env}")

module Proauth
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.service_account_client_id = ENV.fetch("SERVICE_ACCOUNT_CLIENT_ID")
    config.service_account_client_secret = ENV.fetch("SERVICE_ACCOUNT_CLIENT_SECRET")
    config.service_account_login = ENV.fetch("SERVICE_ACCOUNT_LOGIN")
    config.auth_host = ENV.fetch("AUTH_HOST")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
