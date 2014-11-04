class Goal < ActiveRecord::Base
  validates :key_name, presence: true
  has_many :task_goals
  has_many :tasks, through: :task_goals
end
