class User < ApplicationRecord
    has_many :revisions
    validates :name, :email, :password, :password_confirmation, presence: true, allow_blank: false
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
end
