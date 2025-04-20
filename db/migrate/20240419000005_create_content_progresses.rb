class CreateContentProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :content_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.string :status, null: false
      t.datetime :completed_at

      t.timestamps null: false
    end

    add_index :content_progresses, [:user_id, :content_id], unique: true
  end
end 