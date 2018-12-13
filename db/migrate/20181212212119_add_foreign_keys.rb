class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :Image_comment, :Image
    add_foreign_key :Image, :Page
    add_foreign_key :Image, :Revision
  end
end
