class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :int
  end
end
