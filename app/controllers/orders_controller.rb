class OrdersController < ApplicationController
	@@orderIndex = 1
	@@orders = Hash.new([])

	def initialize()
		@now = Time.now
  	end

	def create
		order = Order.new()
		order.id = format("%s%04d", @now.strftime("%Y%m%d"), @@orderIndex+=1) 
		order.products = Product.find(params[:productIds])

		@@orders[session[:user_id]].push order

		logger.warn "User added product #{params[:productIds]} to order: #{@orderId}"

		redirect_to :action => "show", :id => @order.id
	end

	def show
		@order = Order.find(params[:id])
	end
	
	def confirm
		@orderId = params[:id]
		@productIds = @orders[@orderId]

		logger.warn "User confirmed order: #{@orderId}"
	end
	def cancel
		@orderId = params[:id]
		logger.warn "User canceled order: #{@orderId}"
	end
	def index
	end
end

