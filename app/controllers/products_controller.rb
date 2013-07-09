class ProductsController < ApplicationController
	def new
	end

	def ids
		render json: Product.all.sort_by{|p| p[:price]}.collect{|p| p.id}
	end

	def create
		@product = Product.new(params[:product])
		@product.id = params[:product][:id]
		@product.save
		logger.warn "Add new product #{@product.id} with price #{@product.price.to_f}, operator: Zhang Ran"

		flash[:info] = "Add product: #{@product}"
		redirect_to :action => "index"
	end

	def show
		@product = Product.find(params[:id])
		@cart =Cart.find_by_user_id(session[:user_id])
		logger.warn "User is viewing detail of product #{params[:id]}"
	end
	
	def index
		@products = Product.all
	end

	def compare
		logger.warn "User is comparing products #{params[:id]}"
		@productIds = params[:id].split(",").collect{|id| id.to_i}
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		oldPrice = @product.price
		@product.price = params[:product][:price]
		@product.save
		logger.warn "Update price of product #{params[:id]} from #{oldPrice.to_f} to #{@product.price.to_f}, operator: Zhang Ran"

		redirect_to @product
	end
end
