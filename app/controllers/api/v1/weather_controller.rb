module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # Rails.cache.fetch("get_the_data", :expires_in => 15.minutes) do
          render json: WeatherSerializer.new(Weather.new(params[:location]))
        # end
      end

    end
  end
end
