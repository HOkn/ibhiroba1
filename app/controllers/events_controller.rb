class EventsController < ApplicationController
  def show
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "ご参加登録、ありがとうございました！のちほど岡庭・沖・多田より確認のメールを送らせていただきます。"
      redirect_to root_path
      flash[:notice] = "ご参加登録、ありがとうございました！のちほど岡庭・沖・多田より確認のメールを送らせていただきます。"
    else
      flash[:alert] = "!!ALERT!! エラーのため登録ができませんでした。フォームをもう一度ご確認ください。"
      render 'show'
    end
  end

  def index
    @events = Events.all
  end

  def edit
    # @school = School.find(params[:school_id])
    # @comment = @school.comments.find(params[:id])
  end

  def update
    # @school = School.find(params[:school_id])
    # @comment = @school.comments.find(params[:id])
    # if @comment.update_attributes(event_params)
    #   redirect_to school_path(@school)
    # else
    #   render 'edit'
    # end
  end

  def destroy
  end


  private
    def event_params
      params.require(:event).permit(:name, :email, :comment, :school, :session)
    end
end
