class TasksController < ApplicationController
    before_action :find_task, only: [:show, :destroy, :update]
    before_action :authenticate, only: [:create, :destroy, :update]

    def index
        @tasks = Task.all

        render json: TaskSerializer.new( @tasks )
    end

    def show
        render json: TaskSerializer.new( @task )
    end

    def create
        @task = Task.create(
            title: params[:title],
            description: params[:description],
            volunteersNeeded: params[:volunteersNeeded],
            user_id: @user.id
        )

        render json: {task: @task}
    end

    def update
        @task.update(
            title: params[:title],
            description: params[:description],
            volunteersNeeded: params[:volunteersNeeded],
        )
        render json: { task: @task }
    end

    def destroy
        @task.destroy
        render json: {message: "Successfully removed"}
    end

    private

    def find_task
        @task = Task.find(params[:id])
    end
end
