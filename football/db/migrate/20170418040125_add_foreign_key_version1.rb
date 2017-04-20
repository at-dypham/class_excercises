class AddForeignKeyVersion1 < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :teams_groups, :teams
    add_foreign_key :teams_groups, :groups
    add_foreign_key :groups, :tournaments
  end
end
