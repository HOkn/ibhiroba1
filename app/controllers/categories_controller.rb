class CategoriesController < ApplicationController
  before_filter :require_login
  def new
    if current_user.email == "haru.okaniwa@ezweb.ne.jp"
      @user = current_user
      @category = Category.new
      @categories = Category.all
    else
      redirect_to root_url
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_url
    else
      redirect_to categories_new_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
