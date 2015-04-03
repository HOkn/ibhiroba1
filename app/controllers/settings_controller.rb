class SettingsController < ApplicationController
  before_filter :require_login
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params_user)
      @user.save
      redirect_to user_url(@user), notice: "アカウント設定を更新しました"
    else
      render :edit
    end
  end


  private
  def params_user
    params.require(:user).permit(:screen_name, :email, :password, :password_confirmation, :status, :child_age1, :child_age2, :residence_country, :residencenow, :school, :origin, :wannaknow, :know, :bio, :mailmagazine, :comment, :privacy, :parent)
  end
end
