class ChangeColumnTypeForTotalCost < ActiveRecord::Migration[7.0]
  def change
    change_column(:orders, :total_cost, :float)
  end
end
