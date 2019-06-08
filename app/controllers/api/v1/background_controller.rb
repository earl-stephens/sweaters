module Api
  module V1
    class BackgroundController < ApplicationController

      def index
        render json: BackgroundSerializer.new(Background.new(params[:location]))
      end

    end
  end
end
