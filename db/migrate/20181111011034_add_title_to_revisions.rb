class AddTitleToRevisions < ActiveRecord::Migration[5.2]
  def change
    add_column :revisions, :title, :string
  end
end
