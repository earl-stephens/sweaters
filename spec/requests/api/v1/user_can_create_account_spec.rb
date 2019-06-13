require "rails_helper"

RSpec.describe 'user can make api call', type: :request do
  it 'to create an account' do
    body = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
          }
          
    post '/api/v1/users', :params => body

    user = User.last
    expect(user.email).to eq("whatever@example.com")
    expect(response).to be_successful

    results = JSON.parse(response.body)
    expect(response.status).to eq(201)
    expect(results).to have_key("api_key")
  end

  it 'to create an account sad path' do
    user1 = User.create!(email: "whatever@example.com", api_key: "12343", password: "password")
    body = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
          }
    post '/api/v1/users', :params => body

    expect(response.status).to eq(404)
  end

end
