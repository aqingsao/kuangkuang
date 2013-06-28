class ProductsController < ApplicationController
	def new
	end

	def create
		@product = Product.new(params[:product])
		@product.save
		redirect_to @product
	end

	def show
		@product = Product.find(params[:id])
		logger.warn "User is browsing product #{params[:id]}"
	end
	
	def index
		@products = Product.all
	end

	def compare
		logger.warn "User is comparing products #{params[:id]}"
		@productIds = params[:id].split(",").collect{|id| id.to_i}
	end
end
