class AddDecriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :decription, :text
  end
end
