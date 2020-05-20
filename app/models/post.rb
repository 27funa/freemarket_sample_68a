class Post < ApplicationRecord
  belongs_to :user

  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true

  
  validates :item_name, presence: true
  validates :description, presence: true
  validates :sales_status, presence: true
  validates :brand, presence: true
  validates :condition, presence: true
  validates :shipping_area, presence: true
  validates :arrival_days, presence: true
  validates :postage_payment, presence: true

  
end
