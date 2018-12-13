class Revision < ApplicationRecord
    belongs_to :page
    belongs_to :user
    has_many_attached :images

    validates :title, :contents, presence: true, allow_blank: false
end
