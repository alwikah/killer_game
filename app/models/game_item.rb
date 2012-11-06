class GameItem < ActiveRecord::Base
  attr_accessible :player, :next_game_item, :mission, :game, :next_game_item_id, :mission_id, :game_id, :killed

  #belongs_to :player,   :class_name => 'Player'
  belongs_to :mission,  :class_name => 'Mission'
  belongs_to :game,     :class_name => 'Game'

  belongs_to :next_game_item,   :class_name => 'GameItem'

end
