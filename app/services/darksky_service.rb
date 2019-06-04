class DarkskyService

  def initialize(location)
    @location = location
  end

  def get_weather_data
    conn = Faraday.new("https://api.darksky.net/#{ENV['dark_sky_api']}") do |f|
      f.adapter Faraday.default_adapter
    end
    results = conn.get("/forecast/#{ENV['dark_sky_api']}/#{@location}")
    results
    # binding.pry
  end

end
