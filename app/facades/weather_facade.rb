class WeatherFacade

  def initialize(location)
    @location = location
  end

  def current
    { "icon" => weather_results["currently"]["icon"],
      "summary" => weather_results["currently"]["summary"],
      "temperature" => weather_results["currently"]["temperature"],
      "high_temperature" => weather_results["daily"]["data"][0]["temperatureHigh"],
      "low_temperature" => weather_results["daily"]["data"][0]["temperatureLow"],
      "location" => location_results,
      "time" => weather_results["currently"]["time"],
      "long_summary" => weather_results["daily"]["data"][0]["summary"],
      "feels_like" => weather_results["currently"]["apparentTemperature"],
      "humidity" => weather_results["currently"]["humidity"],
      "visibility" => weather_results["currently"]["visibility"],
      "uv_index" => weather_results["currently"]["uvIndex"]
    }
  end

  def hourly
    { "hourly" => weather_results["hourly"]["data"].map do |datum|
                    { "time" => datum["time"],
                      "temperature" => datum["temperature"]
                    }
                  end
    }
  end

  def daily
    { "daily" => weather_results["daily"]["data"].map do |datum|
                    { "icon" => datum["icon"],
                      "time" => datum["time"],
                      "percent_precip" => datum["precipProbability"],
                      "type_of_precip" => datum["precipType"],
                      "high_temp" => datum["temperatureHigh"],
                      "low_temp" => datum["temperatureLow"]
                    }
                end
    }
  end

  def weather_results
    darksky_weather_results = DarkskyService.new(@location)
    weather_results = darksky_weather_results.get_weather_data
  end

end
