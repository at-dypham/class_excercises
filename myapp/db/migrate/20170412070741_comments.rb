class Comments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :first_name
      t.string :last_name
      t.string :decription
      t.timestamps
    end
  end
end
