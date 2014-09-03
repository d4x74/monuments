class PicturesController < ApplicationController

  before_filter :authenticate_user!
 
  def index
    @pictures = Picture.all
    respond_to do |format|
      format.html
      format.json  { render :json => @pictures }
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @picture }
    end
  end

  def new
    @picture = Picture.new
    @collections = Collection.all
    @categories = Category.all  
 
    respond_to do |format|
      format.html
      format.json  { render :json => @picture }
      format.json  { render :json => @collections }
      format.json  { render :json => @categories }
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(pictures_params)
    respond_to do |format|
      if @picture.save
          format.html  { redirect_to(pictures_url, :notice => 'Picture Added Successfully.') }
          format.json  { head :no_content }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @Picture.errors,:status => :unprocessable_entity }
      end
    end
  end

  def update
    @picture = Picture.find(params[:id])
    respond_to do |format|
      if @picture.update_attributes(pictures_params)
          format.html  { redirect_to(pictures_url, :notice => 'Picture Updated Successfully.') }
          format.json  { head :no_content }
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
       format.html  { redirect_to(pictures_url, :notice => 'Picture Removed Successfully.') }
       format.json { head :no_content }
    end
  end
  
  private
  def pictures_params
       params.require(:picture).permit(:id,:name,:description,:user_id,:monument_id,:photo,:date)
  end
  
end