class Order < ApplicationRecord
  has_many :products
  has_many :special_codes
end
