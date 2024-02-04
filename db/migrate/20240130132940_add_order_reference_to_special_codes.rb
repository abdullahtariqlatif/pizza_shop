class AddOrderReferenceToSpecialCodes < ActiveRecord::Migration[7.1]
  def change
    add_reference :special_codes, :order, null: false, foreign_key: true
  end
end
