class PlanetsController < ApplicationController
  respond_to :json

  def index
    @planets = Planet.all
    respond_with @planets
  end

  def create
    @planet = Planet.new params[:planet]
    if @planet.save
      respond_with @planet, status: :accepted
    else
      respond_with @planet, status: :unprocessable_entity
  end
end

  def update
    @planet = Planet.find params[:id]
    if @planet.update_attributes params[:planet]
      respond_with @planet, status: :accepted
    else
      respond_with @planet, status: :unprocessable_entity
  end
end

 def destroy
    Planet.find(params[:id]).destory
 end


end
