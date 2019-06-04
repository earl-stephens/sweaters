class GoogleService

  def initialize(location)
    @location = location
  end

  def get_lat_long
    conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['google_key']}&address=#{@location}") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    coordinates = results[:results][0][:geometry][:bounds][:northeast][:lat].round(4).to_s +
              "," +
              results[:results][0][:geometry][:bounds][:northeast][:lng].round(4).to_s
    coordinates
  end

end
