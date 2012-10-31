class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    Player.create(params[:player])
    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    Player.update_attributes(params[:player])
    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.delete

    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

end
