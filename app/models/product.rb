class Product < ApplicationRecord
  belongs_to :user
  
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :messages_product
  has_many :messages, through: :messages_product

  accepts_nested_attributes_for :categories
end
