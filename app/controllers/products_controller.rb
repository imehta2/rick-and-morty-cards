# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @characters = Character.all

    # Apply search filter if the "query" parameter is present
    if params[:query].present?
      puts "Search Query: #{params[:query]}"
      @characters = @characters.where("name LIKE ?", "%#{params[:query]}%")
    end

    # Apply status filter if present
    if params[:status].present? && params[:status] != 'All Status'
      puts "Status Filter: #{params[:status]}"
      @characters = @characters.where(status: params[:status])
    end

    # Apply gender filter if present
    if params[:gender].present? && params[:gender] != 'All Gender'
      puts "Gender Filter: #{params[:gender]}"
      @characters = @characters.where(gender: params[:gender])
    end

    # Paginate the filtered characters
    @characters = @characters.page(params[:page])
  end
end
