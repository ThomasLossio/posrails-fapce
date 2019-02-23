class Api::V1::ProductsController < ApplicationController
	def hello_world
		render json: {message: 'Hello API'}
	end

	def list
		render json: Product.all
	end

	def create
		product = Product.new
		puts params
		product.name = params['name']
		product.quantity = params['quantity']

		if product.save
			render json: product
		else
			render json: {"error": "product could'n be saved"}
		end
	end

end
