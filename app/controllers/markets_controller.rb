class MarketsController < ApplicationController

  # def market_tools
  #   if params[:id]
  #     @market = Market.find(params[:id])
  #   else
  #     @market = Market.find_by_name(params[:name])
  #   end
  # end
  #
  # def form_market
  #   if params[:id]
  #     @market = Market.find(params[:id])
  #   else
  #     @market = Market.find_by_name(params[:name])
  #   end
  # end
  #
  # def form_market_update
  #   @market = Market.find(params[:id])
  #   if request.get?
  #     logger.debug "get"
  #   elsif request.put?
  #     logger.debug "put"
  #     @market.update(post_params)
  #   end
  # end


  def new
    @market = Market.new
  end

  def create
    @market = Market.new(post_params)
    if @market.save
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
    find_market
  end

  def update
    find_market
    if @market.update(post_params)
      redirect_to "/vendor-tools"
    else
      render :edit
    end
  end

  private

  def find_market
    @sale = Market.find_by(params[:id])
  end

  def post_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end


  def destroy
      @market = Market.find(params[:id])
      @market.destroy
  end


end
