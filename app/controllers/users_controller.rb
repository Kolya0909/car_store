class UsersController < ApplicationController
  before_action :authenticate_user!
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
    if @user.update(users_params)
      flash[:success] = 'Інформацию успішно відредаговано'
      redirect_to '/homepage'
    else
      flash[:error] = "Поля і'мя та фамілія не можуть бути пустими!"
      redirect_to edit_user_path(@user)
    end
  end

  def create
    @user = User.create(users_params)
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :name, :surname, :avatar)
  end

end
