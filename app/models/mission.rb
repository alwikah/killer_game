class Mission < ActiveRecord::Base
  attr_accessible :description

  has_one :victim, :class_name => 'Player', :inverse_of => :weak_point, :foreign_key => :weak_point_id
end
