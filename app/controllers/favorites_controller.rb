class FavoritesController < ApplicationController
  before_filter :require_login

  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @favorite = current_user.favorites.build(question_id: @question.id)
    if @favorite.save
      redirect_to user_question_path(@user, @question), notice: "お気に入りに追加しました"
    else
      redirect_to user_question_path(@user, @question), alert: "これはお気に入りに登録できません"
    end
  end

  def destroy
    @user = current_user
    @question = Question.find(params[:question_id])
    @favorite = Favorite.where(user_id: current_user.id).find_by!(question_id: params[:question_id])
    @favorite.destroy
    redirect_to user_question_path(@user, @question), notice: "お気に入りを解除しました"
  end
end