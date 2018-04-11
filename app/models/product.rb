class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :picture, presence: true
  validate :picture_size
  mount_uploader :picture, PictureUploader

private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "5MB以下にしてください")
      end
    end
end
