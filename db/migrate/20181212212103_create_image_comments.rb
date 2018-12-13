class CreateImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :image_comments do |t|
      t.string :user
      t.text :comment

      t.timestamps
    end
  end
end
