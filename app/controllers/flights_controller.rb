class FlightsController < ApplicationController
  
  def index
    @flights = Flight.all
  end

def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new params[:flight]
    if @flight.save
      redirect_to flights_path
    else
      render :action => 'new'
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update_attributes(secure_params)
      redirect_to flights_path, :notice => "flight updated."
    else
      redirect_to flights_path, :alert => "Unable to update flight."
    end
  end

  def destroy
    flight = Flight.find(params[:id])
    flight.destroy
    redirect_to flights_path, :notice => "flight deleted."
  end

  private

  def secure_params
    params.require(:flight).permit(:departure, :arrival)
  end

end
