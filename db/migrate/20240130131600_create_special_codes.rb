class CreateSpecialCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :special_codes do |t|
      t.string :type
      t.string :name
      t.string :unique_code
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
