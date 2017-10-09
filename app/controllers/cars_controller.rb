class CarsController < ApplicationController
  include CarsHelper
  before_action :logged_in_user, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :logged_in_as_admin, only: [ :destroy, :edit, :update]
  before_action :can_destroy, only: [:destroy]
  
  # GET /cars
  # GET /cars.json
  def index
    if isAdmin? || isSuperAdmin?
      @q_cars = Car.ransack(params[:q])
    elsif isCustomer?
      @q_cars = Car.where.not(status: "Suggested").ransack(params[:q])
    end
    @cars = @q_cars.result().paginate(page: params[:page])
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:success] = "New car added!"
      redirect_to @car
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(car_params)
      flash[:sucess] = "Car info updated."
      redirect_to @car
    else
      render :edit
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
    reservations = Reservation.where(car_id: @car.id)
    reservations.destroy_all
    @car.destroy
    flash[:success] = 'Car deleted.'
    redirect_to cars_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_car
    #   @car = car.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:licensePlateNumber, :manufacturer, :model, :hourlyRentalRate, :style, :location, :status)  
    end
    
    def can_destroy
      @car = Car.find(params[:id])
      # reservations = Reservation.where("car_id = ? AND reservationStatus IS NOT IN (?)", @car.id, ["Complete", "Cancel"])
      reservation_in_use = Reservation.where(car_id: @car.id)
                                .where.not(reservationStatus: ['Complete', 'Cancel']).size != 0
      if @car.status != "Available" || reservation_in_use
        flash[:danger] = "This car is in use. It cannot be deleted now!"
        redirect_to @car
      end
    end
    
end
