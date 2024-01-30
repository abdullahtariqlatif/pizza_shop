class AddToppingRefrenceToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :topping, index: true
  end
end
