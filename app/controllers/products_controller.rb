class ProductsController < ApplicationController

    def index
      @products = Product.where(:vendor_id => session["vendor_id"])
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(post_params)
      @product.vendor_id = session["vendor_id"]
      if @product.save
        redirect_to "/", :notice => "You've created a product!"
      else
        render :new, :error => "There was an error creating the product."
      end
    end

    def edit
      find_product

    end

    def update
      find_product
      if @product.update(post_params)
        redirect_to "/", :notice => "You have successfully updated your product"
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to "/", :notice => "You have successfully deleted the product"
    end

    private

    def find_product
      @product = Product.find(params[:id])
    end

    def post_params
      params.require(:product).permit(:name, session["vendor_id"])
    end

end
