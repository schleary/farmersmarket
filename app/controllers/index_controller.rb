class IndexController < ApplicationController

  def index
   if session["vendor_id"] == nil
     @vendor = Vendor.new
   else
     @vendor_id = session["vendor_id"]
     @vendor = Vendor.find_by_id(@vendor_id)
     render :homepage
   end
  end

  def sign_in
    @vendor = Vendor.find_by_name(params["name"])
    if @vendor != nil
      session["vendor_id"] = @vendor.id
      redirect_to "/"
    else
      flash[:error] = "Sorry we could not find the vendor '" + params["name"] + "'. Please try again."
      @vendor = Vendor.new
      render :index
    end
  end

end
