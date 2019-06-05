require "rails_helper"

describe 'a user can get weather data' do
  it 'via an api call' do
    get '/api/v1/forecast?location=denver,co', headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    expect(response).to be_successful

    wx_data = JSON.parse(response.body)

    expect(wx_data["data"]["attributes"]["current_wx"]).to have_key("temperature")
    expect(wx_data["data"]["attributes"]["current_wx"]["summary"]).to be_an_instance_of(String)
    expect(wx_data["data"]["attributes"]["current_wx"]).to have_key("uv_index")
    expect(wx_data["data"]["attributes"]['hourly_wx']["hourly"].length).to eq(49)
    expect(wx_data["data"]["attributes"]["daily_wx"]["daily"].length).to eq(8)
  end
end
