class DarkskyService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    service = GoogleService.new(@location)
    service.get_lat_long
  end

  def get_weather_data
    conn = Faraday.new("https://api.darksky.net/#{ENV['dark_sky_api']}") do |f|
      f.adapter Faraday.default_adapter
    end
    results = conn.get("/forecast/#{ENV['dark_sky_api']}/#{get_coordinates}")
    results
    # binding.pry
  end

end
