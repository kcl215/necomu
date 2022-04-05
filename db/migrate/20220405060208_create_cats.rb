class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.integer :customer_id
      t.string :cat_name
      t.integer :gender
      t.text :introduction
      t.text :other

      t.timestamps
    end
  end
end
