class Revision < ApplicationRecord
    belongs_to :page
    belongs_to :user

    validates :title, :contents, presence: true, allow_blank: false
end
