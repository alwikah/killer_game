class ChangeGameItem < ActiveRecord::Migration
  def up
    remove_column 'game_items', 'victim_id'
    add_column 'game_items', 'next_game_item_id', :integer
  end

  def down
    remove_column 'game_items', 'next_game_item_id'
    add_column 'game_items', 'victim_id', :integer
  end
end
