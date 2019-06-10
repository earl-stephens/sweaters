module Api
  module V1
    class FavoritesController < ApplicationController

      def create
        if correct_key? == false
          render file: 'public/401', :status => 401
        else
          Favorite.find_or_create_by(location: params[:location], user_id: current_user.id)
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
