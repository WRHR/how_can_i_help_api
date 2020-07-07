class TasksController < ApplicationController
    before_action :find_task, only: [:show, :destroy, :update]

    def index
        @tasks = Task.all 

        render json: {tasks: @tasks}
    end

    def show
        render json: {task: @task}
    end

    def create
        @task = Task.create(task_params)

        render json: {task: @task}
    end

    def update
        @task.update(task_params)
    end

    def destroy
        @task.destroy
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :volunteersNeeded, :user_id)
    end

    def find_task
        @task = Task.find(params[:id])
    end
end
