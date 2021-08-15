class CommentsController < ApplicationController

  def create
    @user = current_user
    @car = Car.find(params[:car_id])
    @comment = @car.comments.create(comment_params)
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

  private

  def comment_params
    params.require(:comment).permit(:body).with_defaults(user_id: current_user.id)
  end

end
