class VendorsController < ApplicationController

    def index
      @vendors = Vendor.all
    end

    def create
      @vendor = Vendor.new(post_params)
      if @vendor.save
        session["vendor_id"] = @vendor.id
        redirect_to "/", :notice => "You've created a new vendor. You are now signed in."
      else
        redirect_to "/", :error => "There was an error creating the vendor you passed in."
      end
    end

    def destroy
      @vendor = Vendor.find_by_id(session["vendor_id"])
      @vendor.destroy
      session["vendor_id"] = nil
      redirect_to "/", :notice => "You've successfully deleted your current vendor."
    end

    def edit
      @vendor = Vendor.find_by_id(session["vendor_id"])
      @markets = Market.all
      @products = Product.all
      @sales = Sale.all
    end

    def update
      @vendor = Vendor.find_by_id(session["vendor_id"])
      if @vendor.update(post_params)
        redirect_to "/", :notice => "You have successfully edited your vendor information."
      else
        render :edit, :error => "There was an error editing your vendor information."
      end
    end

    private

    # def find_vendor
    #   @vendor = Vendor.find(params[:id])
    # end

    def post_params
      params.require(:vendor).permit(:name, :employees, :market_id)
    end


end
