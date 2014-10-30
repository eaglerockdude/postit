class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update]

  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]

def new
  @category = Category.new
end


def show

end

  def index

  end

  def edit

  end

def create

  @category = Category.new(category_params)    #use strong parms

  if @category.save
    flash[:notice]  = "Category was created successfully."
    redirect_to posts_path
  else
    render :new
  end
end

  def update

  end

private

def category_params
  params.require(:category).permit(:name)
end

def set_category
  @category = Category.find_by(slug: params[:id])
end

end