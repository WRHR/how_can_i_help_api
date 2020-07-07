class UsersController < ApplicationController
    def create
        @user = User.create(user_params)

        render json: { user: @user }
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
