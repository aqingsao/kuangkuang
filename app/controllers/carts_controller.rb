class CartsController < ApplicationController
	def add
		userId = session[:user_id]
		cart = Cart.find_by_user_id(userId)
		if(cart == null){
			cart = Cart
		}
		@@shoppingCart[session[:user_id]].push(Product.find(params[:id]))

		@products = @@shoppingCart[session[:user_id]]

		logger.warn "User added product #{params[:id]} to shopping cart"
	end

	def remove

	end
end