class GoogleService

  def initialize(location)
    @location = location
  end

  def get_lat_long
    coordinates = get_json[:results][0][:geometry][:bounds][:northeast][:lat].round(4).to_s +
              "," +
              get_json[:results][0][:geometry][:bounds][:northeast][:lng].round(4).to_s
    coordinates
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['google_key']}&address=#{@location}") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def location_name
    get_json[:results][0][:formatted_address]
  end

end
