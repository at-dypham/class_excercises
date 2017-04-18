class Group < ActiveRecord::Migration[5.0]
  def change
     create_table :groups do |t|
      t.string :name
      t.references :tournament, foreign_key: true
    end
  end
end
