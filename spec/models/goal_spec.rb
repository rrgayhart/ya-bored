require 'rails_helper'

RSpec.describe Goal, :type => :model do
  describe 'Validations' do
    it { should validate_presence_of :key_name }
  end

  describe 'Associations' do
    it { should have_many :task_goals }
    it { should have_many(:tasks).through(:task_goals) }
  end
end
