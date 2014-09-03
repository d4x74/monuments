class SearchController < ApplicationController
  include PgSearch
  def index
     if (params[:findthis].present?)
         # @results = Monument.where("name like '%"+search+"%'"+" OR description like '%"+search+"%'")
         PgSearch.multisearch_options = { :using => :tsearch }
         @results = PgSearch.multisearch(params[:findthis])
         @searched_item = params[:findthis].to_s
         @type = "tsearch"
     elsif params[:album].present?
         @results = Monument.where(:collection_id => params[:album])
         @collection = Collection.find(params[:album])
         @searched_item = @collection.title
         @type = "bycollection"
     elsif params[:category].present?
         @results = Monument.where(:category_id => params[:category])
         @category = Category.find(params[:category])
         @searched_item = @category.name
         @type = "bycategory"
     else
         @searched_item = "Select a Category OR an Album, OR try a text search"
     end
     respond_to do |format|
      format.html 
      format.json  { render :json => @searched_item }
      format.json  { render :json => @results }
      format.json  { render :json => @type }
    end
  end
   
end
