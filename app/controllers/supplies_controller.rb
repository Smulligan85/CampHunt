class SuppliesController < ApplicationController

  def create
    @supply = Supply.find_or_create_by(supply_params)
    @supply.save
    redirect_to root_path
  end

  def update
    @supply = Supply.find(params[:id])
    @supply.update(supply_params)
  end

  private

  def supply_params
    params.require(:supply).permit(:name)
  end
end
