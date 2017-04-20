class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :number_of_team
      t.string :creator
      t.timestamps
    end
  end
end
