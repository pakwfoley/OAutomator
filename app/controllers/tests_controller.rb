class TestsController < ApplicationController
  def new
    @last_test_results = params || {}
  end

  def run
    if can_use_client_credentials?
      redirect_to tests_new_path(client_credentials: 'passed')
    else
      redirect_to tests_new_path(client_credentials: 'failed')
    end
  end

  private

  def can_use_client_credentials?
    token = Procore::Auth::ClientCredentials.new(
      client_id: Rails.application.config.service_account_client_id,
      client_secret: Rails.application.config.service_account_client_secret,
      host: Rails.application.config.auth_host
    ).refresh

    store.save(token)

    user = client.get("me")

    user.body["login"] == Rails.application.config.service_account_login
  end
end
