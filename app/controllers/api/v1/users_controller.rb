module Api
  module V1
    class UsersController < ActionController::API

      def create
        new_key = User.get_key
        new_user = User.new(
                            email: params["email"],
                            password: params["password"],
                            api_key: new_key
                            )
        if new_user.save
          render json: { "api_key": "#{new_user.api_key}"}, :status => 201
        else
          render :status => 404, file: 'public/404'
        end
      end

    end
  end
end
