class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    validates :title, :body, presence: true, allow_blank: false, uniqueness: true
    def to_param
        title
    end

    attr_accessor :image

    after_save :save_image_filepath, if: :image

    def save_image_filepath
        filename = image.original_filename
        folder = "public/images/#{id}/"

        FileUtils::mkdir_p folder

        f = File.open File.join(folder, filename), "wb"
        f.write image.read()
        f.close

        self.image = nil
        update file_path: filename
    end
end
