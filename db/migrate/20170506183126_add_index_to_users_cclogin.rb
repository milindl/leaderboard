class AddIndexToUsersCclogin < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :cclogin, unique: true
  end
end
