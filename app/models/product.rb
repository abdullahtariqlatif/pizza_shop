class Product < ApplicationRecord
  belongs_to :order, class_name: "Order", foreign_key: "Order_id"
  has_one :product_type, class_name: "ProductType"
  has_many :topping, class_name: "Product", foreign_key: "product_id"
end
