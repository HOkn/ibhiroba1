class UsersController < ApplicationController
  before_filter :require_login

  def favorites
    @user = User.find(params[:id])
  end

  # GET /users
  # GET /users.json
  def index
    if current_user.email == "haru.okaniwa@ezweb.ne.jp"
      @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @favorite_questions = []
    @question_id = @user.favorites.each do |favorite|
      @question = Question.find(favorite.question_id)
      @favorite_questions.push(@question)
    end

    @myquestions = []
    @question_id = @user.questions.each do |question|
      @question = Question.find(question.id)
      @myquestions.push(@question)
    end

    @myanswers = []
    @answer_id = @user.answers.each do |answer|
      @question = answer.question
      @answer = Answer.find(answer.id)
      @myanswers.push(@answer)
    end


  end

  # GET /users/new
  def new
    @user = User.new
  end
end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end

