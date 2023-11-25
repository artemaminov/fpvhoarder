class Chat < ApplicationRecord
  has_many :chat_messages
  has_many :messages, through: :chat_messages
end
