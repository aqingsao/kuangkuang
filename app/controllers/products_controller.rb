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
	end
	
	def index
		@products = Product.all
	end
end
