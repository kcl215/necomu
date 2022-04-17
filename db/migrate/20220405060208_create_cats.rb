class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.integer :customer_id
      t.string :cat_name, null: false
      t.integer :gender, null: false
      t.text :introduction
      t.text :other

      t.timestamps
    end
  end
end
