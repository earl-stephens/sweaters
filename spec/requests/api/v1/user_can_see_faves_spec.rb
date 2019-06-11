require "rails_helper"

RSpec.describe 'user can send api call', type: :request do
  it 'to see weather in all favorite cities' do
    user1 = User.create!(email: "goofy@disney.com", password: "password", api_key: "abcd1234")
    user1.favorites.create!(location: "Orlando, FL")
    user1.favorites.create!(location: "Seattle, WA")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "api_key" => "abcd1234"
    }

    get '/api/v1/favorites', :params => body

    expect(response).to be_successful
    results = JSON.parse(response.body)

    expect(results.first["data"]["attributes"]["current_wx"]["location"]).to eq("Orlando, FL, USA")
    expect(results.first["data"]["attributes"]["current_wx"]).to have_key("temperature")
    expect(results.first["data"]["attributes"]["current_wx"]).to have_key("uv_index")
    expect(results.first["data"]["attributes"]['hourly_wx']["hourly"].length).to eq(49)
    expect(results.first["data"]["attributes"]["daily_wx"]["daily"].length).to eq(8)
  end
end
