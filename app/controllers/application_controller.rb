class ApplicationController < ActionController::API
    def authenticate
       secret = Rails.application.secret_key_base
       token = request.headers["Authorization"]
       if !token
            render json: { error: "You must be logged in to do this."}, status: :unauthorized
       else
            decoded_token = JWT.decode(token.split(' ')[1], secret)[0]
            @user = User.find(decoded_token["user_id"])
       end
    end
end
