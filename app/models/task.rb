class Task < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_resources
  has_many :resources, through: :task_resources
  has_many :task_goals
  has_many :goals, through: :task_goals

  MINUTE_BREAKDOWN = [['a Short Break', 5], ['a Pomodoro', 25], ['an Hour-ish', 60], ['All Damn Day', 300]]

  def self.fart_around
    task_ids = computer_tasks & easy_tasks
    task_ids.present? ? Task.find(task_ids.sample) : nil
  end

  def self.select_a_set(search_params, resource_ids)
    resource_ids = clean_up_id_array(resource_ids)
    Task.
      includes(:resources).where(:resources => {:id =>  resource_ids }).
      where("minutes <= ?", search_params[:minutes].to_i).order("RANDOM()").first
  end

  private

  def self.clean_up_id_array(id_array)
    id_array.reject(&:empty?).map(&:to_i)
  end

  def self.computer_tasks
    resource = Resource.find_or_create_by(name: 'computer')
    TaskResource.where(resource_id: resource.id).pluck(:task_id)
  end

  def self.easy_tasks
    Task.where("minutes < ?", 16).pluck(:id)
  end
end
