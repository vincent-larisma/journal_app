class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_category_id, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories
    end

    def show
        @tasks = @category.tasks

        # @events = @tasks.where("time < ?", params[:due_date])
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit 
    end

    def update 

        if @category.update(category_params)
            redirect_to category_path
        else
            render :edit
        end
    end

    def destroy 
        @category.destroy

        redirect_to categories_path
    end

    private

    def find_category_id
        @category = current_user.categories.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:category_detail, :category_title)
    end

end
