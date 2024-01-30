class Order < ApplicationRecord
  has_many :products, inverse_of: :order
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

  has_many :special_codes
end
