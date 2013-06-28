class CartsController < ApplicationController
	def add
		logger.warn "User added the following products to cart: #{params[:id]}"
		@productIds = params[:id].split(",").collect{|id| id.to_i}
	end
end
