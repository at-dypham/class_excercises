class CreateTournemants < ActiveRecord::Migration[5.0]
  def change
    create_table :tournemants do |t|

      t.timestamps
    end
  end
end
