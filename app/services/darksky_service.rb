class DarkskyService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    google_service_call.get_lat_long
  end

  def get_weather_data
    Rails.cache.fetch("#{@location}/get_the_data", :expires_in => 15.minutes) do
      conn = Faraday.new("https://api.darksky.net/forecast/#{ENV['dark_sky_api']}/#{get_coordinates}") do |f|
        f.adapter Faraday.default_adapter
      end
      response = conn.get
      results = JSON.parse(response.body)
    end
  end

  def grab_location
    google_service_call.location_name
  end

  def google_service_call
    google_service = GoogleService.new(@location)
  end

end
