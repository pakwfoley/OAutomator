require "procore"
Procore.configure do |config|
  # Base API host name. Alter this depending on your environment - in a
  # staging or test environment you may want to point this at a sandbox
  # instead of production.
  config.host = ENV.fetch("PROCORE_BASE_API_PATH", "http://localhost:3000")

  # Integer: Number of times to retry a failed API call. Reasons an API call
  # could potentially fail:
  # 1. Service is briefly down or unreachable
  # 2. Timeout hit - service is experiencing immense load or mid restart
  # 3. Because computers
  #
  # Defaults to 1 retry. Would recommend 3-5 for production use.
  # Has exponential backoff - first request waits a 1.5s after a failure,
  # next one 2.25s, next one 3.375s, 5.0, etc.
  config.max_retries = 3

  # Float: Threshold for canceling an API request. If a request takes longer
  # than this value it will automatically cancel.
  config.timeout = 5.0

  # Instance of a Logger. This gem will log information about requests,
  # responses and other things it might be doing. In a Rails application it
  # should be set to Rails.logger
  config.logger = Rails.logger

  # String: User Agent sent with each API request. API requests must have a user
  # agent set. It is recomended to set the user agent to the name of your
  # application.
  config.user_agent = "MyAppName"
end
