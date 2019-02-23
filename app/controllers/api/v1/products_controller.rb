class Api::V1::ProductsController < ApplicationController
	def hello_world
		render json: {message: 'Hello API'}
	end

	def list
		products = Product.all
		render json: products, status: :ok
	end

	def create
		product = Product.new
		product.name = params[:name]
		product.quantity = params[:quantity]

		if product.save
			render json: product
		else
			render json: {"errors": product.errors}
		end
	end

	def destroy
		product = Product.find_by_id(params[:id])
		product.destroy
	end

	def find
		render json: Product.find_by_id(params[:id])
	end

	def update
		product = Product.find_by_id(params[:id])
		product.name = params[:name]
		product.quantity = params[:quantity]

		if product.save
			render json: product
		else
			render json: {"errors": product.errors}
		end
	end

end
