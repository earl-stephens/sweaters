require "rails_helper"

describe 'user can get a background image' do
  it 'via an api call' do
    get '/api/v1/backgrounds?location=denver,co', headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["attributes"]["url"]).to be_an_instance_of(String)
  end
end
