class OrdersController < ApplicationController
	before_action :user_signed_in?
	
	def checkout
		@order = Order.new
		@user = current_user
	end

	def create
		@order = Order.new(order_params)
		@order.planned_delivery_date = Date.today + 2
		if @order.save
			current_cart.cart_items.each do |item|
				order_item = @order.order_items.build
				order_item.cd_id = item.cd_id
				order_item.quantity = item.quantity
				order_item.price = item.cd.price
				if order_item.save
					item.destroy
				end
			end
			redirect_to payment_path
		else
			render :checkout
		end
	end

	def payment
		@order = Order.where(cart_id: current_cart.id).last
	end

	def omise
    Omise.public_api_key = "YOUR KEY"
    Omise.secret_api_key = "YOUR KEY"
    token = Omise::Token.create(
      :card => {:name => params[:name],
        :number => params[:number],
        :expiration_month => params[:exp_month],
        :expiration_year => params[:exp_year],
        :city => params[:city],
        :postal_code => params[:postal_code],
        :security_code => params[:cvc]}
        )
    charge = Omise::Charge.create(
      {:amount => params[:amount], :currency => "jpy", :card => token.id}
      )
    redirect_to confirmation_path
  end

	def confirmation
		@order = Order.where(cart_id: current_cart.id).last
	end

	def status
		@order = Order.find(params[:id])
	end

	def status_edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to status_path(@order)
	end

	private
	def order_params
		params.require(:order).permit(:cart_id, :user_id, :planned_delivery_date, :ready_to_shipping_date, :shipping_date, :delivery_status, :gift_address, :gift_postcode, :gift_name, :gift_phone_number)
	end
end
