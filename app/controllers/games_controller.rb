# -*- encoding : utf-8 -*-
class GamesController < ApplicationController
  def index
    @missions = Mission.all
    @players = Player.all
    @message = params.has_key?(:message) ? params[:message] : nil
    @games = Game.all
  end

  def create
    @players = Player.all
    @missions = Mission.all

    if @missions.count < @players.count
      respond_to do |format|
        format.html{ redirect_to root_path(:message => "Il n'y a pas assez de missions, il en manque #{@players.count - @missions.count} pour pouvoir lancer le jeu...")}
      end
    else
      @game = Game.create

      @players.shuffle!
      @missions.shuffle!

      @players.each_with_index do |player, index|
        game_item = GameItem.new(:player => player, :game => @game, :mission => @missions.pop)
        if(index < @players.count - 1)
          game_item.victim = @players[index+1]
        else
          game_item.victim = @players[0]
        end
        game_item.save
      end

      respond_to do |format|
        format.html{redirect_to game_path(@game)}
      end
    end
  end

  #def init_game
  #  @players = Player.all
  #  @players.each{|p| p.weak_point = nil; p.save}
  #  respond_to do |format|
  #    format.html{ redirect_to root_path(:message => "Jeu réinitialisé")}
  #  end
  #end

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


end
