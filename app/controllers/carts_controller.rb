class CartsController < ApplicationController
	before_filter :loadCart

	def add
		product = Product.find(params[:productId])
		@cart.products.push  product unless @cart.products.member?(product)
		
		logger.warn "User added product #{params[:productId]} to shopping cart"

		redirect_to @cart
	end

	def show
	end

	def remove

	end

	protected 

	def loadCart
		userId =session[:userId]
		@cart = Cart.find_by_user_id(userId)
		@cart = Cart.create(:user_id=>userId) if @cart == nil
	end
end