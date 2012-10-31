class RemoveRelationMissionPlayer < ActiveRecord::Migration
  def up
    remove_column 'players', :weak_point_id
  end

  def down
    add_column 'players', :weak_point_id, :integer
  end
end
