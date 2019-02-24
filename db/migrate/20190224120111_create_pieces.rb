class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
