class GameItem < ActiveRecord::Base
  attr_accessible :player, :victim, :mission, :game, :player_id, :victim_id, :mission_id, :game_id

  belongs_to :player,   :class_name => 'Player'
  belongs_to :victim,   :class_name => 'Player'
  belongs_to :mission,  :class_name => 'Mission'
  belongs_to :game,     :class_name => 'Game'

end
