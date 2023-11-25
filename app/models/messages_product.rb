class MessagesProduct < ApplicationRecord
  belongs_to :message
  belongs_to :product
end
