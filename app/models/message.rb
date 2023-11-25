class Message < ApplicationRecord
  require "./lib/services/tg/commands"
  belongs_to :user

  has_many :messages_product
  has_many :products, through: :messages_product

  has_many :chat_messages
  has_many :chats, through: :chat_messages

  attr_accessor :uploads, :city
  accepts_nested_attributes_for :user, :products

  after_save :send_to_tg

  def self.prepare_new
    message = self.new
    message.build_user
    product = message.products.build
    product.build_category
    product.user = message.user
    message
  end

  def send_to_tg
    debugger
  end
end
