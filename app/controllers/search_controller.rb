class SearchController < ApplicationController
  def create
    palabra = "%#{params[:keyword]}%"
    
    @products = Product.where("name LIKE ? OR description LIKE ?", palabra,palabra)
    #raise @products.to_yaml
    
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: @products}
      
      format.js
    end
  end
end
