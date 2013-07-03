class CartsController < ApplicationController
	before_filter :loadCart

	def add
		product = Product.find(params[:productId])
		@cart.products.push  product unless @cart.products.member?(product)
		
		logger.warn "User added product #{params[:productId]} to shopping cart"

		redirect_to :action=>"show"
	end

	def show
		logger.warn "User added product #{params[:productId]} to shopping cart"
	end

	def remove
		@cart.products.delete Product.find(params[:productId])
		logger.warn "User removed product #{params[:productId]} from shopping cart"

		redirect_to :action=>"show"
	end

	protected 

	def loadCart
		userId =session[:user_id]
		@cart = Cart.find_by_user_id(userId)
		@cart = Cart.create(:user_id=>userId) if @cart.nil?
	end
end