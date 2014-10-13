class SalesController < ApplicationController

  def index
    @sales = Sale.where(:vendor_id => session["vendor_id"])
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(post_params)
    @sale.vendor_id = session["vendor_id"]
    if @sale.save
      redirect_to "/", :notice => "You've created a sale!"
    else
      render :new, :error => "There was an error creating the sale."
    end
  end

  def edit
    find_sale
  end

  def update
    find_sale
    if @sale.update(post_params)
      redirect_to "/", :notice => "You have successfully updated your sale"
    else
      render :edit
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    edirect_to "/", :notice => "You have successfully deleted the sale"
  end

  private

  def find_sale
    @sale = Sale.find(params[:id])
  end

  def post_params
    params.require(:sale).permit(:amount, :purchase_time, session["vendor_id"], :product_id)
  end


end
