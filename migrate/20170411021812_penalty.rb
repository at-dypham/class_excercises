class Penalty < ActiveRecord::Migration[5.0]
  def change
    create_table :penalties do |t|
      t.string :score
      t.references :match , foreign_key: true
    end
  end
end
