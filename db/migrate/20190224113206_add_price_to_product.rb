class AddPriceToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_reference :prices, :product, index: true
  end
end
