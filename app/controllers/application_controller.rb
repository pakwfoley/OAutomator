class ApplicationController < ActionController::Base
  def store
    Procore::Auth::Stores::Session.new(session: session)
  end

  def client
    Procore::Client.new(
      client_id: "client id",
      client_secret: "client secret",
      store: store
    )
  end
end
