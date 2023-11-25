class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :messages_product
  has_many :messages, through: :messages_product

  accepts_nested_attributes_for :category
end
