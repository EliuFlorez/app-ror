class Category < ApplicationRecord
  has_many :has_categories
  has_many :posts, through: :has_categories
end
