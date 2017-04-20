class CreateTeamsGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_groups do |t|
      t.integer :team_id
      t.integer :group_id
      t.timestamps
    end
  end
end
