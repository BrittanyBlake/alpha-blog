class CategoriesController < ApplicationController
    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "You have successfully created a new article"
            redirect_to @category
        else
            render 'new'
        end
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end