class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :jersey_number
      t.boolean :stanley_cup
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
