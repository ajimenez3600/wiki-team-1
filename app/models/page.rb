class Page < ApplicationRecord
    has_many :revisions
    def to_param
        title
    end
end
