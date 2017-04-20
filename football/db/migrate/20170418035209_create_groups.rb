class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :tournament_id
      t.text :description
      t.timestamps
    end
  end
end
