class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :numberunit
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :phone
      t.integer :hours
      t.timestamps null: false
    end
  end
end
