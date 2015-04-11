class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save

      login(:email, :password)
      redirect_to questions_path
    else
      render :new
    end
  end

  private
  def params_user
    params.require(:user).permit(:screen_name, :email, :password, :password_confirmation, :status, :child_age1, :child_age2, :residence_country, :residencenow, :school, :origin, :wannaknow, :know, :bio, :mailmagazine, :comment, :privacy)
  end
end