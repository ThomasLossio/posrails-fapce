class AddPiecesToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_reference :pieces, :product, index: true
  end
end
