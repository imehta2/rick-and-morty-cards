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
        character_id: item['id'],
        quantity: item['quantity'],
        price: Character.find(item['id']).price
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

    pst_rate = province.PST
    gst_rate = province.GST
    hst_rate = province.HST

    calculate_tax_amount(total_price, pst_rate, gst_rate, hst_rate)
  end

  private

  def calculate_tax_amount(total_price, pst_rate, gst_rate, hst_rate)
    (total_price * (pst_rate + gst_rate + hst_rate) / 100).round(2)
  end

  def place_order
    # Process the form submission and payment here
    # This is where you should handle the payment using the Stripe API

    # For example:
    @token = params[:token]
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    begin
      charge = Stripe::Charge.create({
        amount: (@final_total * 100).to_i,
        currency: 'usd',
        description: 'Rick and Morty Collectibles Order',
        source: @token,
      })

      # Create an Order record in the database and handle order details

      flash[:notice] = "Payment successful! Your order has been placed."
      redirect_to order_confirmation_path  # Redirect to the order confirmation page

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to checkout_checkout_path
    end
  end
end
