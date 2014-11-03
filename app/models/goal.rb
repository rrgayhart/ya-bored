class Goal < ActiveRecord::Base
  validates :key_name, presence: true
end
