class Blacklist < ApplicationRecord
    validates :ip, uniqueness: true
end
