class MonumentsController < ApplicationController

  before_filter :authenticate_user!,:except=>[:index]
 
  def index
    @monuments = Monument.all
    respond_to do |format|
      format.html
      format.json  { render :json => @monuments }
    end
  end
  
  def show
    @monument = Monument.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @monument }
    end
  end

  def new
    @monument = Monument.new
    @picture = Picture.new
    
    @collections = Collection.all
    @categories = Category.all  
 
    respond_to do |format|
      format.html
      format.json  { render :json => @monument }
      format.json  { render :json => @collections }
      format.json  { render :json => @categories }
    end
  end

  def edit
    @monument = Monument.find(params[:id])
  end

  def create
    @monument = Monument.new(monuments_params)
    @monument.user_id = current_user.id
    respond_to do |format|
      if @monument.save
          if params[:imgs]
            params[:imgs].each { |image| @monument.pictures.create(:photo=>image)}
          end
          format.html  { redirect_to(monuments_url, :notice => 'Monument Created Successfully.') }
          format.json  { head :no_content }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @monument.errors,:status => :unprocessable_entity }
      end
    end
  end

  def update
    @monument = Monument.find(params[:id])
    respond_to do |format|
      if @monument.update_attributes(monuments_params)
          format.html  { redirect_to(monuments_url, :notice => 'Monument Updated Successfully.') }
          format.json  { head :no_content }
      end
    end
  end

  def destroy
    @monument = Monument.find(params[:id])
    @monument.destroy
    respond_to do |format|
       format.html  { redirect_to(monuments_url, :notice => 'Monument Removed Successfully.') }
       format.json { head :no_content }
    end
  end
  
  private
  def monuments_params
       params.require(:monument).permit(:id,:name,:description,:user_id,:category_id,:collection_id)
  end
  
end