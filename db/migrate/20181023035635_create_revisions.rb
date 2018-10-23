class CreateRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :revisions do |t|
      t.integer :user_id
      t.integer :page_id
      t.text :contents

      t.timestamps
    end
  end
end
