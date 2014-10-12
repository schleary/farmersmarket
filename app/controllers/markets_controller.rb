class MarketsController < ApplicationController

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(post_params)
    if @market.save
      redirect_to "/", :notice => "You've created a market!"
    else
      render :new, :error => "There was an error creating the market."
    end
  end

  def edit
    find_market
  end

  def update
    find_market
    if @market.update(post_params)
      # CHANGE THIS STUFF!
      redirect_to "/"
    else
      render :edit
    end
  end

  def destroy
    @market = Market.find(params[:id])
    @market.destroy
  end

  private

  def find_market
    @market = Market.find(params[:id])
  end

  def post_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
