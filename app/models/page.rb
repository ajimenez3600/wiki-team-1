class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    def to_param
        title
    end
end
