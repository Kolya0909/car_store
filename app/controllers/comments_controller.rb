class CommentsController < ApplicationController

  def create
    @car = Car.find(params[:car_id])
    (@comment = @car.comment.create(comment_params))
    redirect_to car_path(@car)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:car_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @car
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end

end
