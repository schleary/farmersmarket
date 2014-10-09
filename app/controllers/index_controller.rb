class IndexController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(post_params)
    if @vendor.save
      # session[:vendor_id] = @vendor.id
      redirect_to "/vendor-tools"
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

  def edit
    find_vendor
  end

  def update
    find_vendor
    if @vendor.update(post_params)
      redirect_to "/vendor-tools"
    else
      render :edit
    end
  end

  private

  def find_vendor
    @vendor = Vendor.find(params[:id])
  end

  def post_params
    params.require(:vendor).permit(:name, :employees, :market_id)
  end


end
