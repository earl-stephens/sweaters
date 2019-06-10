require "rails_helper"

RSpec.describe 'user can post favorite location', type: :request do
  it 'via an api call' do
    user1 = User.create!(email: 'minnie@disney.com', password: "password", api_key: "abcd1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "location" => "Denver, CO",
      "api_key" => "abcd1234"
    }
    post '/api/v1/favorites', :params => body

    expect(user1.favorites.last.location).to eq("Denver, CO")
  end

  it 'via an api call sad path wrong key' do
    user1 = User.create!(email: 'minnie@disney.com', password: "password", api_key: "abcd1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "location" => "Denver, CO",
      "api_key" => "xyz"
    }
    post '/api/v1/favorites', :params => body

    expect(response.status).to eq(401)
  end

  it 'via an api call sad path no api key' do
    user1 = User.create!(email: 'minnie@disney.com', password: "password", api_key: "abcd1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    body = {
      "location" => "Denver, CO"
    }
    post '/api/v1/favorites', :params => body

    expect(response.status).to eq(401)
  end
end
