class TasksController < ApplicationController
    before_action :authenticate_user!

    def create
        @category = current_user.categories.find(params[:category_id])
        @category.tasks.create(task_params)

        redirect_to category_path(@category)
    end

    def show
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:category_id])
    end

    def edit
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:category_id])
        
    end

    def update
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])

         if @task.update(task_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id]).destroy
        redirect_to category_path(@category)

    end

    private

    def task_params
        params.require(:task).permit(:task_title, :task_detail, :due_date)
    end
end
