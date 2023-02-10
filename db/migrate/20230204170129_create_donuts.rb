class CreateDonuts < ActiveRecord::Migration[7.0]
  def change
    create_table :donuts do |t|
      t.string :name
      t.string :description
      t.float :price
      t.float :rating, default: 0
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
