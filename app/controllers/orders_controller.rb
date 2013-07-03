class OrdersController < ApplicationController
	@@orderIndex = 1
	@@orders = Hash.new()
	# @@userOrders = Hash.new([])

	def initialize()
		@now = Time.now
  	end

	def 
		@orderId = format("%s%04d", @now.strftime("%Y%m%d"), @@orderIndex+=1)
		# @@userOrders[userId].push(@orderId)
		@@orders[@orderId] = params[:productIds]
		logger.warn "User added product #{@productIds} to order: #{@orderId}"

		redirect_to :action => "show", :id => @orderId
	end

	def show
		@orderId = params[:id]
		@productIds = @@orders[@orderId]
	end
	
	def confirm
		@orderId = params[:id]
		@productIds = @orders[@orderId]

		logger.warn "User confirmed order: #{@orderId}"
	end
	def cancel
		@orderId = params[:id]
		logger.warn "User canceled order: #{@orderId}"
	end
	def index
	end
end

