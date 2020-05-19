class AddNumberToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :number, :string
  end
end
