class VolunteersController < ApplicationController
    before_action :authenticate, only: [:create, :destroy]

    before_action :find_volunteer, only: [:destroy, :show]

    def index
        @volunteers = Volunteer.all
        render json: {volunteers: @volunteers}
    end

    def show
        render json: { volunteer: @volunteer }
    end

    def create 
        require_login
        @volunteer = Volunteer.create(task_id: params[:task_id], user_id: @user.id)
        render json: {message: 'Thanks for Helping!'}
    end

    def destroy
        @volunteer.destroy
        render json: {message: "You are no longer going to help"}
    end

    private

    def find_volunteer
        @volunteer = Volunteer.find(params[:id])
    end

    def require_login
        if !@user
            render json: {error: 'You must be logged in to help'}, status: :unauthorized
        end
    end

end
