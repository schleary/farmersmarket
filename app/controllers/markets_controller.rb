class MarketsController < ApplicationController


  def form_market

  end

  def form_market_update
    if request.get?
      @market = Market.find(params[:id])
      logger.debug "get"
    elsif request.put?
      @market = Market.find(params[:id])
      logger.debug "put"
      @market.update(post_params)
    elsif request.post?
      create
    end
  end


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
