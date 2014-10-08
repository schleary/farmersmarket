class IndexController < ApplicationController

  def index
    @vendors = Vendors.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:name, :employees, :market_id))
    if @vendor.save
      redirect_to root_path
    else
      render :new
    end
  end

end
