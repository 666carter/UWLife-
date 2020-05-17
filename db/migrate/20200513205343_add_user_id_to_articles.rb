class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :housings, :user_id, :int
    add_column :carpools, :user_id, :int
    add_column :carpools, :description, :string
  end
end
