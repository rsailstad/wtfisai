class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :stripe_customer_id
      t.string :stripe_subscription_id
      t.string :plan_type

      t.timestamps null: false
    end

    add_index :subscriptions, :stripe_customer_id
    add_index :subscriptions, :stripe_subscription_id
  end
end 