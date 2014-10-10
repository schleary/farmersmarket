class ProductsController < ApplicationController



    def new
      @product = Product.new
    end

    def create
      @product = Product.new(post_params)
      if @product.save
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
    def show
      @product = Product.find(session[:id])
    end

    def edit
      find_product
    end

    def update
      find_product
      if @product.update(post_params)
        redirect_to "/vendor-tools"
      else
        render :edit
      end
    end

    private

    def find_product
      @product = Product.find(params[:id])
    end

    def post_params
      params.require(:vendor).permit(:name, :employees, :market_id)
    end


    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end

end
