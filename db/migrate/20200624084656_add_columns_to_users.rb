class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :user_info, :text
    add_column :users, :display_name, :text
  end
end
