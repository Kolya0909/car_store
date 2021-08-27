class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @car = @user.cars
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to '/homepage'
  end

  def create
    @user = User.create(users_params)
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :name, :surname, :avatar)
  end

end
