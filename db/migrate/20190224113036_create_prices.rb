class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.float :value
      t.string :currency

      t.timestamps
    end
  end
end
