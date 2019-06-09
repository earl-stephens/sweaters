require "rails_helper"

RSpec.describe 'user can make an api call' do
  it 'to log in' do
    user1 = User.create!(email: "whatever@example.com",
                        password: "password",
                        api_key: "1234abcd")
    body = { "email" => "whatever@example.com",
                        "password" => "password" }

    post '/api/v1/sessions', :params => body

    results = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(results["api_key"]).to eq(user1.api_key)
  end

  it 'to log in sad path' do
    user1 = User.create!(email: "whatever@example.com",
                        password: "password",
                        api_key: "1234abcd")
    body = { "email" => "whatevs@example.com",
                        "password" => "password" }

    post '/api/v1/sessions', :params => body

    expect(response.status).to eq(401)
    # 
    # results = JSON.parse(response.body)
    # expect(response.status).to eq(200)
    # expect(results["api_key"]).to eq(user1.api_key)
  end

end
