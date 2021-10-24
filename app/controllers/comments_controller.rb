class CommentsController < ApplicationController

  def create
    @user = current_user
    @car = Car.find(params[:car_id])
    @comment = @car.comments.create(comment_params)
      if @comment.save
        flash[:success] = 'Коментар успішно додано'
        redirect_to car_path(@car)
      else
        flash[:error] = 'Переконайтеся що поле не є пустим!'
        redirect_to car_path(@car)
    end

  end

  def new

  end

  def show
    @car = Car.find(params[:car_id])
    @comment = Comment.where(car_id: params[:id])
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
