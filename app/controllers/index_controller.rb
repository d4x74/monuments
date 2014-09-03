class IndexController < ApplicationController
  
  def index
    @monuments = Monument.all.order(:created_at).reverse_order.limit(20)
    respond_to do |format|
      format.html
      format.json  { render :json => @monuments }
    end
  end
  
end
