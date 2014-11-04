class TaskGoal < ActiveRecord::Base
  belongs_to :task
  belongs_to :goal
end
