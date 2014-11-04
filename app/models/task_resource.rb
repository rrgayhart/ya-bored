class TaskResource < ActiveRecord::Base
  belongs_to :task
  belongs_to :resource
end
