class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book
  belongs_to :address
  belongs_to :user
end
