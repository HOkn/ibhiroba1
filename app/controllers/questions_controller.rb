class QuestionsController < ApplicationController

  def index
      @questions = Question.all
  end


  def show
    @user = current_user
    @question = Question.find(params[:id])
    @question = Question.includes(:answers).find(params[:id])
    @questionuser = User.find(@question.user_id)
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @user=current_user
    @question = Question.new(question_params)
    @category = Category.find(params[:category][:id])
    @question.user_id = @user.id
    if @question.save & @question.categories << @category
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @question = Question.find(params[:id])
    @category = @question.categories
    @categories = Category.all
  end

  def update
    @user = current_user
    @question = Question.find(params[:id])
    @category = Category.find(params[:category][:id])

    if @question.update_attributes(question_params)& @question.categories << @category
      @question.save
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def index_category
    @questions = Question.all
    @question_id = []
    @question_id = QuestionCategory.question_id
  end


  private
  def question_params
    params.require(:question).permit(:title, :content, :user_id,  :category, :category_id)
  end

end
