# -*- encoding : utf-8 -*-
class GamesController < ApplicationController
  def index
    @missions = Mission.all
    @message = params.has_key?(:message) ? params[:message] : nil
    @games = Game.all
  end

  def create
    @players = []
    players_name = params[:players].select{|n| !n.blank?}

    @missions = Mission.all

    if @missions.count < @players.count
      respond_to do |format|
        format.html{ redirect_to root_path(:message => "Il n'y a pas assez de missions, il en manque #{@players.count - @missions.count} pour pouvoir lancer le jeu...")}
      end
    else
      @game = Game.create(:finished => false)
      @game.launch_game(players_name, @missions.shuffle)

      respond_to do |format|
        format.html{redirect_to game_path(@game)}
      end
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.delete

    respond_to do |format|
      format.html{redirect_to root_path}
    end

  end

  def show
    @game = Game.find(params[:id])
  end

  def clean_games
    games = Game.all
    games.each do |game|
      wrong_game_items = game.game_items.select{|gi| gi.player.nil? || gi.next_game_item.nil? || gi.mission.nil?}
      game.delete unless wrong_game_items.empty?
    end

    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def init_game

  end

end
