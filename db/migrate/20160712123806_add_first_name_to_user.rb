class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :First_name, :string
    add_column :users, :Last_name, :string
  end
end
