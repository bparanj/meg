class ProductsController < ApplicationController
  def index
    @products = Product.order('created_at DESC').limit(10)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(allowed_params)
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :edit
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end
  
  private
  
  def allowed_params
    params.require(:product).permit!
  end
end
