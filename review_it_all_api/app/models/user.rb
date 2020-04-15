class User < ApplicationRecord
    has_many :reviews

    validates :username, uniqueness: true, presence: true
end
