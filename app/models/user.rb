class User < ApplicationRecord
    has_many :messages
    has_many :products

    def self.authorize(user)
        where(user).first_or_create
    end
end
