class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :position_in_standings
      t.boolean :stanely_cup

      t.timestamps
    end
  end
end
