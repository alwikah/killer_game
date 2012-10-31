class AddGameSave < ActiveRecord::Migration
  def up
    create_table 'games'

    create_table 'game_items' do |table|
      table.integer :player_id
      table.integer :victim_id
      table.integer :mission_id
      table.integer :game_id
    end
  end

  def down
    drop_table 'games'
    drop_table 'game_items'
  end
end
