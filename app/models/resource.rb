class Resource < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_resources
  has_many :tasks, through: :task_resources
end
