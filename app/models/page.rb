class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    validates :title, :body, presence: true, allow_blank: false, uniqueness: true
    def to_param
        title
    end
end
