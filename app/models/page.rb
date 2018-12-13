class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    has_many_attached :images

    validates :title, uniqueness: true
    validates :title, :body, presence: true, allow_blank: false

    def to_param
        title
    end
end
