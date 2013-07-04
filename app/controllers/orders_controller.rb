class OrdersController < ApplicationController
	@@orderIndex = 1

	def initialize()
		super
		@now = Time.now
  	end

	def create
		@order = Order.new(:user_id => session[:user_id])
		@order.id = format("%s%02d%04d", @now.strftime("%Y%m%d"), Random.rand(100), @@orderIndex+=1) 
		logger.warn "User added product #{params[:productIds]} to order: #{@order.id}"

		@order.products = Product.find(params[:productIds])
		@order.save

		cart = Cart.find_by_user_id(session[:user_id])
		cart.products = [] unless cart.nil?
		cart.save unless cart.nil?

		render json: {order: @order.id}
	end

	def show
		@order = Order.find(params[:id])
	end
	
	def confirm
		@orderId = params[:id]

		logger.warn "User confirmed order: #{@orderId}"

		flash[:info] = "User confirmed order: #{params[:id]}"
		redirect_to :action=>"index"
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


	def pay
		logger.warn "User payed order: #{params[:id]}"
		flash[:info] = "User payed order: #{params[:id]}"
		redirect_to :action=>"index"
	end

end

