class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]

    def show
        @category = Category.find(params[:id])
        @articles =  @category.articles.paginate(page: params[:page], per_page: 5)
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

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only an admin can perform this action"
            redirect_to categories_path
        end
    end
end