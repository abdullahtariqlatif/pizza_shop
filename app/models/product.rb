class Product < ApplicationRecord
  belongs_to :order, class_name: "Order", foreign_key: "Order_id"

  has_one :product_type, class_name: "ProductType"
  has_many :toppings, class_name: "Product", foreign_key: "product_id", inverse_of: :products
  accepts_nested_attributes_for :toppings, reject_if: :all_blank, allow_destroy: true
end