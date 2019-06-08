class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password, :api_key
  end
end
