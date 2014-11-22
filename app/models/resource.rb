class Resource < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_resources
  has_many :tasks, through: :task_resources


  def self.none_resource
    where(name: 'none').first_or_create
  end

  def self.computer_resource
    where(name: 'computer').first_or_create
  end
end
