class CategoriesController < ApplicationController
  before_filter :require_login
  def new
    if current_user.email == "haru.okaniwa@ezweb.ne.jp"
      @user = current_user
      @category = Category.new
      @categories = Category.all
    else
      redirect_to questions_path
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to questions_path
    else
      redirect_to categories_new_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.save
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
