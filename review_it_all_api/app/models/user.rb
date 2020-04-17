class User < ApplicationRecord
    has_many :reviews
    has_many :votes

    validates :username, uniqueness: true, presence: true
end
