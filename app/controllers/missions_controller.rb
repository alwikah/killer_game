class MissionsController < ApplicationController

  def new
    @mission = Mission.new
  end

  def create
    Mission.create(params[:mission])
    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    Mission.update_attributes(params[:mission])
    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def destroy
    mission = Mission.find(params[:id])
    mission.delete

    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

end
