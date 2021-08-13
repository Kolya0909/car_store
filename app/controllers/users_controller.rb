class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new

  end

  def show
    @user = User.find(current_user.id)
  end



  def create
    @user = User.create(users_params)
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end

end
