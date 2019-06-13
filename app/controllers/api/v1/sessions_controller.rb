module Api
  module V1
    class SessionsController < ActionController::API

      def create
        user = User.find_by(email: params["email"])
        if user && user.authenticate(params["password"])
          session[:user_id] = user.id
          render json: { "api_key": "#{user.api_key}"}, :status => 200
        else
          render file: 'public/401', :status => 401
        end
      end

    end
  end
end
