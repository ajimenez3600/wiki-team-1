class Page < ApplicationRecord
    has_many :revisions, :dependent => :delete_all
    validates :title, :body, presence: true, allow_blank: false
    def to_param
        title
    end
    
    attr_accessor :img
    
    after_save :save_img, if: :img 
    
    def save_img 
      filename = img.original_filename
      folder = "public/pages/#{id}/image"
      
      FileUtils::mkdir_p folder 
      f = File.open File.join(folder, filename), "wb"
      f.write img.read()
      f.close 
      self.img = nil
      update img_filename: filename
    end
end
