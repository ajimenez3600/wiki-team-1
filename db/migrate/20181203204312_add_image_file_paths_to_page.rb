class AddImageFilePathsToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :file_path, :string
  end
end
