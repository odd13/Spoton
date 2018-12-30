class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :work_type
      t.string :cust_name
      t.string :cust_address
      t.decimal :price
      t.decimal :tax
      t.integer :parent_id, index: { unique: true  } 

      t.timestamps
    end
  end
end
