class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :users, through: :cart_items
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :main_image, presence: true
  validate :picture_size
  mount_uploader :main_image, PictureUploader

private
    def picture_size
      if main_image.size > 5.megabytes
        errors.add(:main_image, "5MB以下にしてください")
      end
    end
end
