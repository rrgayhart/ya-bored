class Task < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_resources
  has_many :resources, through: :task_resources
  has_many :task_goals
  has_many :goals, through: :task_goals

  def self.fart_around
    task_ids = computer_tasks & easy_tasks
    task_ids.present? ? Task.find(task_ids.sample) : nil
  end

  private

  def self.computer_tasks
    resource = Resource.find_or_create_by(name: 'computer')
    TaskResource.where(resource_id: resource.id).pluck(:task_id)
  end

  def self.easy_tasks
    Task.where("minutes < ?", 16).pluck(:id)
  end
end
