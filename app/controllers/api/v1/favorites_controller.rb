module Api
  module V1
    class FavoritesController < ApplicationController

      def index
        if correct_key? == false
          render file: 'public/401', :status => 401
        else
          render json: FavoritesSerializer.new.favorite_location_weather(current_user)
        end
      end

      def create
        if correct_key? == false
          render file: 'public/401', :status => 401
        else
          Favorite.find_or_create_by(location: params[:location], user_id: current_user.id)
        end
      end

      def destroy
        if correct_key? == false
          render file: 'public/401', :status => 401
        else
          to_be_deleted = Favorite.new.get_city_to_delete(params["location"], current_user)
          to_be_deleted[0].destroy
          current_user.reload
          render json: FavoritesSerializer.new.favorite_location_weather(current_user)
        end
      end

      private

      def correct_key?
        current_key = current_user.api_key
        if params[:api_key] == nil or params[:api_key] != current_key
          false
        else
          true
        end
      end

    end
  end
end
