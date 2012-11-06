class Game < ActiveRecord::Base
  attr_accessible :finished, :winner, :winner_id

  has_many :game_items, :class_name => 'GameItem'

  belongs_to :winner, :class_name => 'GameItem'

  def launch_game(players_names, missions)
    game_items = []
    players_names.each do |player|
      game_items << GameItem.new(:player => player, :game => self, :mission => missions.pop, :killed => false)
    end

    game_items.each_with_index do |game_item, index|
      game_item.next_game_item = if index < game_items.count - 1
                                   game_items[index + 1]
                                 else
                                   game_items.first
                                 end
      game_item.save
    end
  end

  def sorted_game_items
    sorted_items = []
    temp = self.game_items.dup.select{|game_item| !game_item.killed?}
    sorted_items << temp.pop
    until temp.empty?
      next_game_item  = temp.select{|gi| gi == sorted_items.last.next_game_item}.try(:first)
      sorted_items << temp.delete(next_game_item)
    end
    sorted_items
  end

  def update_game
    if self.game_items.select{|game_item| !game_item.killed?}.count <= 1
      self.finished = true
      self.winner = self.game_items.select{|game_item| !game_item.killed?}.first
      self.save
    end
  end
end
