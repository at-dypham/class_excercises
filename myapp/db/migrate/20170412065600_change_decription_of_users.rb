class ChangeDecriptionOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :decription, :string
  end
end
