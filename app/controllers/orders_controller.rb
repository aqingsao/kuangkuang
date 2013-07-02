class OrdersController < ApplicationController
	def add
		orderId = 1
		logger.warn "User added product #{params[:id]} to order: #{orderId}"
		@productId = params[:id]
		@orderId = orderId
	end
end

