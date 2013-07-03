class CartsController < ApplicationController
	def add
		userId = session[:user_id]
		cart = safelyGetCart(userId)

		product = Product.find(params[:productId])
		cart.products.push  product unless cart.products.member?(product)
		
		logger.warn "User added product #{params[:productId]} to shopping cart"

		redirect_to :action=>"show", :id=>cart.id
	end

	def show
		@cart = Cart.find(params[:id])
	end

	def remove

	end

	protected 

	def safelyGetCart(userId)
		cart = Cart.find_by_user_id(userId)
		return cart == nil ? Cart.create(:user_id=>userId) : cart;
	end
end