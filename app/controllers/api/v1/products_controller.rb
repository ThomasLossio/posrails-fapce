class Api::V1::ProductsController < ApplicationController
	def hello_world
		render json: {message: 'Hello API'}
	end

	def list
		products = Product.all
		render json: products, status: 200
	end

	def create
		product = Product.new
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
		product = Product.find_by_id(params[:id])

		if product.nil?
			render json: {message: 'Product not found'}, status: :not_found
		else
			product.destroy
		end
	end

	def find
		product = Product.find_by_id(params[:id])

		if product.nil?
			render json: {"message": "Product not found"}, status: 404
		else
			render json: product, status: 200
		end
	end

	def update
		product = Product.find_by_id(params[:id])
		product.name = params[:name]
		product.quantity = params[:quantity]

		if product.save
			render json: product, status: 200 and return
		elsif product.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Product not updated', errors: product.errors}, status: error_status
	end

end
