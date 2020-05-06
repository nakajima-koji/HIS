class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :size
      t.string :memo
      t.string :address

      t.timestamps
    end
  end
end
