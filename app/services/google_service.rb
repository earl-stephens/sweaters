class GoogleService

  def initialize(location)
    @location = location
  end

  def get_lat_long
    coordinates = get_google_data[:results][0][:geometry][:bounds][:northeast][:lat].round(4).to_s +
              "," +
              get_google_data[:results][0][:geometry][:bounds][:northeast][:lng].round(4).to_s
    coordinates
  end

  def get_google_data
    Rails.cache.fetch("#{@location}/get_data_from_google", :expires_in => 15.minutes) do
      conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['google_key']}&address=#{@location}") do |f|
        f.adapter Faraday.default_adapter
      end
      response = conn.get
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def location_name
    get_google_data[:results][0][:formatted_address]
  end

end
