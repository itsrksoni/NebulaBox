require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http success" do
        get "/", headers: { "Host" => "localhost" }
        puts "Status: #{response.status}" # 🔍 debug line
        puts response.body                # 🔍 debug line
        expect(response).to have_http_status(:success)
    end
  end
end

