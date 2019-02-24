class Piece < ApplicationRecord
	validates :name, presence: true
	validates :number, presence: true

	def nil_fields?
		self.name.nil? || self.number.nil?
	end
end
