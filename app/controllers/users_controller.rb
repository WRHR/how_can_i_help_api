class UsersController < ApplicationController
    def create
        @user = User.create(user_params)

        if !@user.save
            render json: { error: "Username is already taken"}, status: :bad_request
        else
            render json: { user: @user, message: "Account Created! Please Log In!" }, status: :created
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
