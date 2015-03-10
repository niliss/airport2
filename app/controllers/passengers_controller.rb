class PassengersController < ApplicationController
  
  def index
    @passengers = Passenger.where(flight_id: params[:flight_id])
  end

def new
    @flight = Flight.find(params[:flight_id])
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(secure_params)
    @passenger.flight_id = params[:flight_id]
    if @passenger.save
      redirect_to flight_passengers_path(params[:flight_id])
    else
      render :action => 'new'
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end
 
  def update
    @passenger = Passenger.find(params[:id])
    if @passenger.update_attributes(secure_params)
      redirect_to passengers_path, :notice => "passenger updated."
    else
      redirect_to passengers_path, :alert => "Unable to update passenger."
    end
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to passengers_path, :notice => "passenger deleted."
  end

  private

  def secure_params
    params.require(:passenger).permit(:flight_id, :name, :passport)
  end

end
