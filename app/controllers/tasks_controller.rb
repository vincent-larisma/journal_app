class TasksController < ApplicationController

    def create
        @category = Category.find(params[:category_id])
        @category.tasks.create(task_params)

        redirect_to category_path(@category)
    end

    def show
        @category = Category.find(params[:id])
        @task = @category.tasks.find(params[:category_id])
    end


    def destroy
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id]).destroy
        redirect_to category_path(@category)

    end

    private

    def task_params
        params.require(:task).permit(:task_title, :task_detail, :due_date)
    end
end
