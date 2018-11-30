class AddImgToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :img_filename, :string
  end
end
