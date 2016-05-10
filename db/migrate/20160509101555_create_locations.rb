class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
	t.string :name
	t.string :address
	t.belongs_to :customer, index: true

      t.timestamps null: false
    end
  end
end
