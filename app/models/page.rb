class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    validates :title, :body, presence: true, allow_blank: false
    def to_param
        title
    end
end
