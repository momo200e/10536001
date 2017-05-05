class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :price
      t.text :introduction

      t.timestamps
    end
  end
end
