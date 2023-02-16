class AddArchivedToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :archived, :boolean
  end
end
