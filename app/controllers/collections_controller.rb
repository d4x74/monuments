class CollectionsController < ApplicationController
  
 before_filter :authenticate_user!
 
 def index
    @collection = Collection.new
    @collections = Collection.all
    respond_to do |format|
      format.html
      format.json  { render :json => @collections }
      format.json  { render :json => @collection }
    end
  end
  
  def show
    @collection = Collection.find(params[:id])
    respond_to do |format|
      format.html 
      format.json  { render :json => @collections }
    end
  end

  def new
    @collection = Collection.new
    respond_to do |format|
      format.html 
      format.json  { render :json => @collection }
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    respond_to do |format|
      if @collection.save
          format.html  { redirect_to(collections_url, :notice => 'Album created successfully.') }
          format.json  { head :no_content }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @collection.errors,:status => :unprocessable_entity }
      end
    end
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.user_id = current_user.id
    respond_to do |format|
      if @collection.update_attributes(collection_params)
          format.html  { redirect_to(collections_url, :notice => 'Album updated successfully.') }
          format.json  { head :no_content }
      end
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    respond_to do |format|
       format.html  { redirect_to(collections_url, :notice => 'Album Removed Successfully.') }
       format.json { head :no_content }
    end
  end

  private
  def collection_params
     params.require(:collection).permit(:id,:title,:user_id)
  end
  
end
