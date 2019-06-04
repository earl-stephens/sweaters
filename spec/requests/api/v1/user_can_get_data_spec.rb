require "rails_helper"

describe 'a user can get weather data' do
  it 'via an api call' do
    get '/api/v1/forecast?location=denver,co', headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    expect(response).to be_successful
# binding.pry
    wx_data = JSON.parse(response.body)
    binding.pry
    expect(wx_data["weather_data"]["currently"]).to have_key("temperature")
    expect(wx_data["weather_data"]["currently"]["temperature"]).to be_an_instance_of(String)
    expect(wx_data["weather_data"]["currently"]).to have_key("uv_index")
    expect(wx_data["weather_data"]['hourly']["data"].length).to eq(49)
    expect(wx_data["weather_data"]['forecast']["data"].length).to eq(8)
  end
end
