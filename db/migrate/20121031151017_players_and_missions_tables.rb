class PlayersAndMissionsTables < ActiveRecord::Migration
  def up
    create_table 'players' do |t|
      t.string :pseudo
      t.integer :weak_point_id
    end

    create_table 'missions' do |t|
      t.text :description
    end
  end

  def down
    drop_table 'players'
    drop_table 'missions'
  end
end
