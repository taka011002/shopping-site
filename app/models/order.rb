class Order < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :order_items, dependent: :destroy
  has_many :product, through: :order_items
  accepts_nested_attributes_for :order_items
end
