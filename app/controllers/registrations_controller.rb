class RegistrationsController < ApplicationController
  # before_filter :set_cache_buster

  def new
    @user = User.new
    expires_in 1.minute, public: true
    # fresh_when last_modified: @users.max(:updated_at)
    # raise
  end

  def create
    @user = User.new(params_user)
    if @user.save
      login(email, password)
      redirect_to questions_path
    else
      render :new
    end
  end

  private
  def params_user
    params.require(:user).permit(:screen_name, :email, :password, :password_confirmation, :status, :child_age1, :child_age2, :residence_country, :residencenow, :school, :origin, :wannaknow, :know, :bio, :mailmagazine, :comment, :privacy)
  end

  # TODO: remove here later
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end