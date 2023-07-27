# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @characters = Character.all.page(params[:page]).per(50)

    # Apply search filter if the "query" parameter is present
    if params[:query].present?
      puts "Search Query: #{params[:query]}"
      @characters = @characters.where("name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    end

    # Apply status filter if present
    if params[:status].present? && params[:status] != 'All Status'
      puts "Status Filter: #{params[:status]}"
      @characters = @characters.where(status: params[:status]).page(params[:page]).per(10)
    end

    # Apply gender filter if present
    if params[:gender].present? && params[:gender] != 'All Gender'
      puts "Gender Filter: #{params[:gender]}"
      @characters = @characters.where(gender: params[:gender]).page(params[:page]).per(10)
    end

    # Paginate the filtered characters
    @characters = @characters.page(params[:page]).per(10)
  end

  def cart
    # Retrieve the cart from the session
    cart = session[:cart] || {}

    # Get the character ids from the cart
    character_ids = cart.keys

    # Fetch the characters from the database using the character ids
    @cart_items = Character.where(id: character_ids).includes(:cart_items)

    # Store the quantities from the cart in the cart_items association
    @cart_items.each { |character| character.cart_items_quantity = cart[character.id.to_s] }
  end

  def add_to_cart
    character = Character.find(params[:character_id])

    # Retrieve the cart from the session or create an empty cart if it doesn't exist
    cart = session[:cart] || {}
    # Check if the item is already in the cart, and increase the quantity if it is
    if cart[character.id.to_s]
      cart[character.id.to_s] += 1
    else
      # If the item is not in the cart, add it as a new item
      cart[character.id.to_s] = 1
    end

    # Save the updated cart back to the session
    session[:cart] = cart

    redirect_to products_path, notice: "#{character.name} added to cart."
  end


  def update_cart_item
    character_id = params[:character_id]
    new_quantity = params[:quantity].to_i

    # Retrieve the cart from the session
    cart = session[:cart] || {}

    if new_quantity > 0
      cart[character_id] = new_quantity
    else
      # If quantity is 0 or less, remove the item from the cart
      cart.delete(character_id)
    end

    # Save the updated cart back to the session
    session[:cart] = cart

    redirect_to cart_path, notice: "Cart item updated."
  end

  def remove_from_cart
    character_id = params[:character_id]

    # Retrieve the cart from the session
    cart = session[:cart] || {}

    # Remove the item from the cart
    cart.delete(character_id)

    # Save the updated cart back to the session
    session[:cart] = cart

    redirect_to cart_path, notice: "Item removed from cart."
  end

end
