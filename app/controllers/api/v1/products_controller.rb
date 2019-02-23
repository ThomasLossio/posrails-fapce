class Api::V1::ProductsController < ApplicationController
	def hello_world
		render json: {message: 'Hello API'}
	end

	def list
		render json: Product.all
	end
end
