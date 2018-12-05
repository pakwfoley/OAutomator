require 'rails_helper'

RSpec.describe TestsController, type: :request do
  describe "GET /new" do
    it "renders new.html.erb" do
      get "/tests/new"

      expect(response).to render_template(:new)
    end
  end

  describe "POST /run" do
    it "calls out to procore" do
      stub_client_credentials

      get "/tests/run"

      expect(response).to redirect_to("/tests/new?client_credentials=passed")
    end
  end
end
