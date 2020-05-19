class ChangeRequestsToPurchases < ActiveRecord::Migration[5.1]
  def change
    rename_table :requests, :purchases
  end
end
