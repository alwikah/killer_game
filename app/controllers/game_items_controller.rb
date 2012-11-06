class GameItemsController < ApplicationController

  def killed
    game_item = GameItem.find(params[:id])

    prev_game_item = GameItem.where(:game_id => game_item.game.id, :next_game_item_id => game_item.id, :killed => false).try(:first)

    unless prev_game_item.nil?
      prev_game_item.next_game_item = game_item.next_game_item
      game_item.killed = true
      prev_game_item.save
      game_item.save
    end

    game_item.game.update_game

    respond_to do |format|
      format.html{redirect_to game_path(game_item.game)}
    end
  end

  def show
    @game_item = GameItem.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
