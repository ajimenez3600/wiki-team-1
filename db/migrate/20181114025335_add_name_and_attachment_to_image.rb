class AddNameAndAttachmentToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :name, :string
    add_column :images, :attachment, :string
  end
end
