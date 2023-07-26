# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @characters = Character.page(params[:page])
  end
end
