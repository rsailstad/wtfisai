class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.references :section, null: false, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false
      t.text :body, null: false
      t.string :content_type, null: false
      t.integer :order, null: false
      t.boolean :premium, default: false
      t.jsonb :metadata

      t.timestamps null: false
    end

    add_index :contents, :slug, unique: true
    add_index :contents, :order
    add_index :contents, :content_type
  end
end 