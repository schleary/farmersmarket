class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(post_params)
    if @sale.save
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
    find_sale
  end

  def update
    find_sale
    if @sale.update(post_params)
      redirect_to "/vendor-tools"
    else
      render :edit
    end
  end

  private

  def find_sale
    @sale = Sale.find(params[:id])
  end

  def post_params
    params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
  end



end
