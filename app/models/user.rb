class User < ApplicationRecord
    has_many :revisions
    validates_confirmation_of :name, :password
    validates_confirmation_of :email, :message => "should match confrimation"
end
