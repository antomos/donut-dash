class ChangeAssociationsOfReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :donut, null: false, foreign_key: true
  end
end
