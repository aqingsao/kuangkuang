class OrdersController < ApplicationController
	@@orderIndex = 1

	def initialize()
		@now = Time.now
  	end

	def create
		@order = Order.new(:user_id => session[:user_id])
		@order.id = format("%s%04d", @now.strftime("%Y%m%d"), @@orderIndex+=1) 
		@order.products = Product.find(params[:productIds])
		@order.save

		logger.warn "User added product #{params[:productIds]} to order: #{@orderId}"

		redirect_to @order
	end

	def show
		@order = Order.find(params[:id])
	end
	
	def confirm
		@orderId = params[:id]

		logger.warn "User confirmed order: #{@orderId}"
		redirect_to :action=>"index", flash: {notice: "User confirmed order: #{@orderId}"}
	end
	def cancel
		Order.find(params[:id]).delete
		logger.warn "User canceled order: #{params[:id]}"

		flash[:info] = "User canceled order: #{params[:id]}"
		redirect_to :action=>"index"
	end

	def index
		@orders = Order.where(:user_id=>session[:user_id])
	end
end

