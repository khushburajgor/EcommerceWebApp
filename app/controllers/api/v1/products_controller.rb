# app/controllers/api/v1/products_controller.rb
module Api
  module V1
    class ProductsController < ApplicationController
      def search
        query = params[:query]
        if query.present?
          @products = Product.where('title ILIKE ? OR description ILIKE ?', "%#{query}%", "%#{query}%")
        else
          @products = Product.all
        end

        render json: @products
      end
    end
  end
end
