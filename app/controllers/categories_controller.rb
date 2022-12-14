class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_category_id, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories
    end

    def show
        @tasks = @category.tasks

        @today_events = @tasks.where("due_date = ?", Date.current)
        @after_events = @tasks.where("due_date > ?", Date.current)
        @before_events = @tasks.where("due_date < ?", Date.current)

    end
    
    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to categories_path, notice: 'Category was successfully created'
        else
            render :new
        end
    end

    def edit 
    end

    def update 

        if @category.update(category_params)
            redirect_to categories_path, notice: 'Category was successfully updated'
        else
            render :edit
        end
    end

    def destroy 
        @category.destroy
        redirect_to categories_path, notice: 'Category was successfully deleted'
    end

    private

    def find_category_id
        @category = current_user.categories.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:category_detail, :category_title)
    end
    

end
