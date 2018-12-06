class AddImageFilePathsToRevision < ActiveRecord::Migration[5.2]
  def change
    add_column :revisions, :file_path, :string
  end
end
