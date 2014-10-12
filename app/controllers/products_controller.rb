class ProductsController < ApplicationController



    def new
      @product = Product.new
    end

    def create
      @product = Product.new(post_params)
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
        # CHANGE THIS STUFF!
        redirect_to "/"
      else
        render :edit
      end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end

    private

    def find_product
      @product = Product.find(params[:id])
    end

    def post_params
      params.require(:product).permit(:name, :vendor_id)
    end

end
