class OrdersController < ApplicationController
	@@orderIndex = 1

	def initialize()
		@now = Time.now
		@orders = Hash.new([])
  	end

	def add
		@orderId = format("%s%04d", @now.strftime("%Y%m%d"), @@orderIndex+=1)
		@productId = params[:id]
		@orders[@orderId].push @productId
		logger.warn "User added product #{params[:id]} to order: #{@orderId}"
	end
	
	def confirm
		@orderId = params[:orderId]
		@productIds = @orders[@orderId]
		logger.warn "User confirmed order: #{@orderId}"
	end
	def cancel
		@orderId = params[:orderId]
		logger.warn "User canceled order: #{@orderId}"
	end
end

