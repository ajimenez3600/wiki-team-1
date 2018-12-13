class AddCommentToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :comment, :string
  end
end
