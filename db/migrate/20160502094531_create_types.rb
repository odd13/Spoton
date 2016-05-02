class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.string :category
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
