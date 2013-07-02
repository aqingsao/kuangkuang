class OrdersController < ApplicationController
	@@orderIndex = 1

	def initialize()
		@now = Time.now
  	end

	def add
		@orderId = format("%s%04d", @now.strftime("%Y%m%d"), @@orderIndex+=1)
		@productId = params[:id]
		logger.warn "User added product #{params[:id]} to order: #{@orderId}"
	end
end

