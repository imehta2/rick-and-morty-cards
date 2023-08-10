# app/controllers/checkout_controller.rb
class CheckoutController < ApplicationController
  def checkout
    @cart = session[:cart] || {}
    @cart_items = fetch_cart_items

    @total_price = calculate_total_price
    @province_id = params[:province_id].to_i
    @province = Province.find_by(id: @province_id)

    @tax = calculate_tax(@total_price, @province)
    @final_total = @total_price + @tax

    if params[:commit] == "Place Order"
      @order = create_order(params[:province_id], params[:name], params[:address], params[:postal_code])
      generate_invoice(@order) if @order

      session[:cart] = {} # Clear the cart after placing the order

      redirect_to order_confirmation_path(order_id: @order.id)
    end
  end

  private

  def create_order(province_id, name, address, postal_code)
    # Create the order
    order = Order.create!(
      province_id: province_id,
      user_id: user_signed_in? ? current_user.id : nil,
      status: "paid"
    )

    # Add order items
    @cart.each do |item|
      OrderItem.create!(
        order_id: order.id,
        pokemon_id: item['id'],
        quantity: item['quantity'],
        price: Pokemon.find(item['id']).price
      )
    end

    # Add user details
    order.update(name: name, address: address, postal_code: postal_code)

    order
  end

  def generate_invoice(order)
    # You can generate the invoice here and save it as needed
  end

  def fetch_cart_items
    Character.where(id: @cart.keys)
  end

  def calculate_total_price
    @cart_items.sum { |character| character.price * @cart[character.id.to_s] }
  end

  def calculate_tax(total_price, province)
    return 0 unless province
    (total_price * (province.PST + province.GST + province.HST) / 100).round(2)
  end

  def process_payment
    @token = params[:token]

    # Replace this with your actual Stripe secret key
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    begin
      charge = Stripe::Charge.create({
        amount: (@final_total * 100).to_i,  # Amount in cents
        currency: 'usd',  # Replace with the appropriate currency code
        description: 'Rick and Morty Collectibles Order',
        source: @token,
      })

      # Here you can update your order status, create line items, etc.
      # For example, you can create an Order record in the database with the relevant details.

      flash[:notice] = "Payment successful! Your order has been placed."
      redirect_to order_confirmation_path  # Replace with the appropriate path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to checkout_checkout_path
    end
  end

end
