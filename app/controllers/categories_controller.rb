class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(allowed_params)
    if @category.save
      flash[:notice] = "Successfully created category."
      redirect_to @category
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated category."
      redirect_to @category
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Successfully destroyed category."
    redirect_to categories_url
  end
  
  private
  
  def allowed_params
    params.require(:category).permit(:name)
  end
end
