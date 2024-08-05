class ProductsController < ApplicationController
  def index
    if params[:query].present?
      begin
        @products = Product.search(params[:query]).records
      rescue Elasticsearch::Transport::Transport::Errors::NoNodesAvailable => e
        flash[:alert] = "Elasticsearch server is not available. Please try again later."
        @products = Product.all
      end
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
