class AirlinesController < ApplicationController


 def index
    @airlines = Airline.all
  end

  def create
    @airline = Airline.new
  end

  def show
    @airline = Airline.find(params[:id])
  end

  def update
    @airline = Airline.find(params[:id])
    if @airline.update_attributes(secure_params)
      redirect_to airlines_path, :notice => "airline updated."
    else
      redirect_to airlines_path, :alert => "Unable to update airline."
    end
  end

  def destroy
    airline = Airline.find(params[:id])
    airline.destroy
    redirect_to airlines_path, :notice => "airline deleted."
  end

  private

  def secure_params
    params.require(:airline).permit(:departure, :arrival)
  end

end
