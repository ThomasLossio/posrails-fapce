class Api::V1::ProductsController < ApplicationController
	before_action :find_product, only: [:show, :update, :destroy]

	def hello_world
		render json: {message: 'Hello API'}
	end

	def index
		products = Product.all
		render json: products, status: 200
	end

	def create
		product = Product.new (product_params)
		product.name = params[:name]
		product.quantity = params[:quantity]

		if product.save
			render json: product, status: 201 and return
		elsif product.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Product not saved', errors: product.errors}, status: error_status
	end

	def destroy

		if @product.nil?
			render json: {message: 'Product not found'}, status: :not_found
		else
			@product.destroy
		end
	end

	def show
		
		if @product.nil?
			render json: {"message": "Product not found"}, status: 404
		else
			render json: @product, status: 200
		end
	end

	def update
		
		if @product.nil?
			render json: {"message": "Product not found"}, status: 404 and return
		end
		@product.name = params[:name]
		@product.quantity = params[:quantity]

		if @product.update (product_params)
			render json: @product, status: 200 and return
		elsif @product.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Product not updated', errors: @product.errors}, status: error_status
	end

	private
	def find_product
		@product = Product.find_by_id(params[:id])
	end

	def product_params
		params.permit(:name, :quantity)
	end
end
