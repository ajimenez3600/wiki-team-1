class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :user
      t.string :dimenstions
      t.integer :filesize
      t.string :filepath

      t.timestamps
    end
  end
end
