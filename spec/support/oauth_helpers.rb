module OauthHelpers
  def stub_client_credentials
    stub_request(:post, "http://login.example.dev/oauth/token").
      with(
        body: {
          client_id: Rails.application.config.service_account_client_id,
          client_secret: Rails.application.config.service_account_client_secret,
          grant_type: "client_credentials"
        }
      ).
      to_return(status: 200, body: "fake-token", headers: {})
  end
end

RSpec.configure do |config|
  config.include OauthHelpers
end
