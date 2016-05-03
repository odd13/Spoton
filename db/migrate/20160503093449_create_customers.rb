class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
	t.string :suburb
	t.string :state
	t.string :state
	t.integer :postcode
	t.string :country
	t.string :email
	t.string :phone
      t.boolean :is_active

	
      t.timestamps null: false
    end
  end
end
