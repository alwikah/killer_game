class AddDeadAttribute < ActiveRecord::Migration
  def up
    add_column 'game_items', 'killed', :boolean
    add_column 'games', 'finished', :boolean
    add_column 'games', 'winner_id', :integer
  end

  def down
    remove_column 'game_items', 'killed'
    remove_column 'games', 'finished'
    remove_column 'games', 'winner_id'
  end
end
