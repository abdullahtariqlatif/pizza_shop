class CreateProductTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_types do |t|
      t.string :unique_id
      t.string :type
      t.string :size

      t.timestamps
    end
  end
end
