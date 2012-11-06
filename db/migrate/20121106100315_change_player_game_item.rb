class ChangePlayerGameItem < ActiveRecord::Migration
  def up
    drop_table 'players'
    remove_column 'game_items', :player_id
    add_column 'game_items', 'player', :string
  end

  def down
    create_table 'players' do |t|
      t.string :pseudo
      t.integer :weak_point_id
    end
    add_column 'game_items', :player_id, :integer
    remove_column 'game_items', 'player'
  end
end
