class VendorsController < ApplicationController

    def vendor_tools
      if params[:id]
        @vendor = Vendor.find(params[:id])
      else
        @vendor = Vendor.find_by_name(params[:name])
      end
    end

    def form_vendor_update
    end

    def edit_market
    end

    def product_settings
    end

    def new
      @vendor = Vendor.new
    end

    def create
      @vendor = Vendor.new(post_params)
      if @vendor.save
        # session[:vendor_id] = @vendor.id
        redirect_to "/vendor-tools/#{@vendor.id}"
      else
        render :new
      end
    end

    def destroy
        @vendor = Vendor.find(params[:id])
        @vendor.destroy
    end

    #
    # def change
    #   add_column :name, :employees, :market_id
    # end
    #
    def show
      @vendor = Vendor.find(session[:id])
    end

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
