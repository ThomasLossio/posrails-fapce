class Product < ApplicationRecord

	def list
		render json: Product.all
	end
end
