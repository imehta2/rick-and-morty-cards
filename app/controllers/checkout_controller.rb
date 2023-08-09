class CheckoutController < ApplicationController
  def checkout
    # Retrieve the cart from the session
    @cart = session[:cart] || {}

    # Fetch the characters from the database using the character ids
    character_ids = @cart.keys
    @cart_items = Character.where(id: character_ids)

    # Calculate the total price of items in the cart
    @total_price = calculate_total_price

    # Determine the selected province ID
    @province_id = params[:Province].to_i

    # Retrieve province information for tax calculations
    @province = Province.find_by(id: @province_id) # Use find_by to avoid ActiveRecord::RecordNotFound


    # Calculate taxes
    @tax = calculate_tax(@total_price, @province)

    # Calculate the final total
    @final_total = @total_price + @tax
  end

  # ... other actions ...

  private

  def calculate_total_price
    total_price = 0
    @cart_items.each do |character|
      total_price += character.price * @cart[character.id.to_s]
    end
    total_price
  end

  def calculate_tax(total_price, province)
    return 0 unless province # Return 0 if province is nil
    (total_price * (province.PST + province.GST + province.HST) / 100).round(2)
  end
end
