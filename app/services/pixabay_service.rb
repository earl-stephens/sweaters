class PixabayService

  def initialize(location)
    @location = location
  end

  def get_image_url
    Rails.cache.fetch("grab_the_image", :expires_in => 15.minutes) do
      conn = Faraday.new('https://pixabay.com/api/?key=12675942-d16fc411eef3574bb214e21f5&q=denver') do |f|
        f.adapter Faraday.default_adapter
      end
      response = conn.get
      JSON.parse(response.body)
    end
  end

  def stripped_location
    @location.split(',')[0]
  end

end
