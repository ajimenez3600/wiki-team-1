class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.string :ip, null: false, default: ""
      t.timestamps
    end
  end
end
