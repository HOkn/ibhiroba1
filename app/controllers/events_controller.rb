class EventsController < ApplicationController
  def show
  end


  def create
    @customer = @school.comments.build(comment_params)
    if @customer.save
      redirect_to root_path
    end
  end

  def index
    @customers = Events.all
  end

  def edit
    # @school = School.find(params[:school_id])
    # @comment = @school.comments.find(params[:id])
  end

  def update
    # @school = School.find(params[:school_id])
    # @comment = @school.comments.find(params[:id])
    # if @comment.update_attributes(comment_params)
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
