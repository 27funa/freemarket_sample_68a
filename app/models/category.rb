class Category < ApplicationRecord
  has_many :post
  has_ancestry
end
