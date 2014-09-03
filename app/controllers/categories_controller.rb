class CategoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @category = Category.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json  { render :json => @category }
      format.json  { render :json => @categories }
    end
  end
  
  def show
     @category = Category.find(params[:id])
     respond_to do |format|
      format.html 
      format.json  { render :json => @category }
    end
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html 
      format.json  { render :json => @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
          format.html  { redirect_to(categories_url, :notice => 'Category created successfully.') }
          format.json  { head :no_content }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @category.errors,:status => :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(category_params)
          format.html  { redirect_to(categories_url, :notice => 'Category updated successfully.') }
          format.json  { head :no_content }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
       format.html  { redirect_to(categories_url, :notice => 'Category Removed Successfully.') }
       format.json { head :no_content }
    end
  end
  
  private
  def category_params
     params.require(:category).permit(:id,:name)
  end
 
end