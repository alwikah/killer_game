class Game < ActiveRecord::Base
  has_many :game_items, :class_name => 'GameItem'

  def sorted_game_items
    sorted_items = []
    temp = self.game_items.dup
    sorted_items << temp.pop
    until temp.empty?
      victim_id       = sorted_items.last.victim_id
      next_game_item  = temp.select{|gi| gi.player_id == victim_id}.try(:first)

      sorted_items << temp.delete(next_game_item)
    end
    sorted_items
  end
end
