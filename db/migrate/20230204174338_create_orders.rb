class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :donut, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity
      t.integer :total_cost
      t.string :status
      t.boolean :complete
      t.date :requested_date
      t.time :requested_time

      t.timestamps
    end
  end
end
