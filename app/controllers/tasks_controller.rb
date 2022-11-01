class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :find_task_id, only: [:create,:update,:destroy ]
    before_action :find_category_task_id, only: [:edit, :show]

    def create     
       @task = @category.tasks.build(task_params)

       if @task.save
            redirect_to category_path(@category), notice: 'Task was successfully created'
        else
            redirect_to category_path(@category), notice: 'Task creation was unsuccessful'
        end
    end

    def show
    end

    def edit     
    end

    def update
        @task = @category.tasks.find(params[:id])

        if @task.update(task_params)
            redirect_to category_path(@category), notice: 'Task was successfully updated'
        else
            render :edit
        end
    end

    def destroy
        @category.tasks.find(params[:id]).destroy
        redirect_to category_path(@category), notice: 'Task was successfully deleted'

    end

    private

    def find_category_task_id
        @category = current_user.categories.find(params[:id])
        @task = @category.tasks.find(params[:category_id])
    end

    def find_task_id
        @category = current_user.categories.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:task_title, :task_detail, :due_date)
    end
end
