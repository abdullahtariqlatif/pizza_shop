class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :unique_id
      t.boolean :status

      t.timestamps
    end
  end
end
