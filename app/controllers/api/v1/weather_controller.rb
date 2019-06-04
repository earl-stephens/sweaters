module Api
  module V1
    class WeatherController < ApplicationController

      def index
        # binding.pry
        render json: WeatherSerializer.new(Weather.new(params[:location]))
      end

    end
  end
end
