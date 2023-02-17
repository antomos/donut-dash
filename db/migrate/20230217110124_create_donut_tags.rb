class CreateDonutTags < ActiveRecord::Migration[7.0]
  def change
    create_table :donut_tags do |t|
      t.references :donut, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
