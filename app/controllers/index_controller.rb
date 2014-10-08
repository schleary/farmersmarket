class IndexController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:vendor_name, :employees, :market_id))
    if @vendor.save
      # session[:vendor_id] = @vendor.id
      redirect_to root_path
    else
      render :new
    end
  end
  #
  # def change
  #   add_column :name, :employees, :market_id
  # end
  #
  # def show
  #   @vendor = Vendor.find(session[:vendor_id])
  # end

end
