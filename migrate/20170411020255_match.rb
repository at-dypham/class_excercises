class Match < ActiveRecord::Migration[5.0]
  def change
     create_table :matches do |t|
      t.integer :team_A_id
      t.integer :team_B_id
      t.datetime :time
      t.string :score
      t.integer :kind
      t.references :tournament, foreign_key: true
    end
  end
end
