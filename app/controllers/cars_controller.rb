class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @car = Car.all
    @user = current_user
    if params[:query]
      @car = @car.search(params[:query].downcase)
      @name = @car
    end
    if(params[:name])
      if (params[:name]=='Усі авто')
        redirect_to cars_path
      else
        @name = params[:name]
        @car = @car.filterName(@name)
      end

    end
    @array = Car.getCarName
  end

  def new
    @user = User.find(current_user.id)
  end

  def show
    @car = Car.find(params[:id])
    @user = User.find(current_user.id)

  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if(@car.update(car_params))
      redirect_to @car
    else
      render 'edit'
    end
  end


  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  def create
    @user = User.find(current_user.id)
    @car = @user.cars.create(car_params)

    if (@car.save)
      redirect_to car_path(@car)
    else
      render 'new'
    end



  end


  private def car_params
    params.require(:car).permit(:name, :series, :year, :price, :probeg, :motor, :kpp, :privod, :color, :info, :stan, :city, :telephone,:image,:use_id)
  end
end
