class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.integer :order, null: false
      t.boolean :premium, default: false

      t.timestamps null: false
    end

    add_index :sections, :slug, unique: true
    add_index :sections, :order
  end
end 