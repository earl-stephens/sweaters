require "rails_helper"

RSpec.describe 'user can send api call', type: :request do
  it 'to delete a favorite city' do
    user1 = User.create!(email: "goofy@disney.com", password: "password", api_key: "abcd1234")
    user1.favorites.create!(location: "Tampa, FL")
    user1.favorites.create!(location: "Miami, FL")
    user1.favorites.create!(location: "Chicago, IL")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "api_key" => "abcd1234",
      "location" => "Tampa, FL"
    }

    delete '/api/v1/favorites', :params => body

    user1.reload
    expect(response).to be_successful
    results = JSON.parse(response.body)

    expect(results.first["data"]["attributes"]["current_wx"]["location"]).to eq("Miami, FL, USA")
    expect(results.first["data"]["attributes"]["current_wx"]).to have_key("temperature")
    expect(results.first["data"]["attributes"]["current_wx"]).to have_key("uv_index")
    expect(results.first["data"]["attributes"]['hourly_wx']["hourly"].length).to eq(49)
    expect(results.first["data"]["attributes"]["daily_wx"]["daily"].length).to eq(8)

    faves = Favorite.where(user_id: user1.id).pluck(:location)
    expect(faves).to_not include("Orlando, FL")
  end

  it 'to delete a favorite city sad path' do
    user1 = User.create!(email: "goofy@disney.com", password: "password", api_key: "abcd1234")
    user1.favorites.create!(location: "Tampa, FL")
    user1.favorites.create!(location: "Miami, FL")
    user1.favorites.create!(location: "Chicago, IL")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "api_key" => "xyz",
      "location" => "Tampa, FL"
    }

    delete '/api/v1/favorites', :params => body

    expect(response.status).to eq(401)
  end
end
