class AddVersionToRevision < ActiveRecord::Migration[5.2]
  def change
    add_column :revisions, :version, :integer
  end
end
