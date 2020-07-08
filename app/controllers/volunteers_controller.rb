class VolunteersController < ApplicationController

    before_action :find_volunteer, only: [:destroy, :show]

    def index
        @volunteers = Volunteer.all
        render json: {volunteers: @volunteers}
    end

    def show
        render json: { volunteer: @volunteer }
    end

    def create
        @volunteer = Volunteer.create(volunteer_params)
        render json: { volunteer: @volunteer}
    end

    def destroy
        @volunteer.destroy
        render json: {message: "You are no longer going to help"}
    end

    private

    def find_volunteer
        @volunteer = Volunteer.find(params[:id])
    end

    def volunteer_params
        params.require(:volunteer).permit(:task_id, :user_id)
    end

end
