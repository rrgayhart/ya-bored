require 'rails_helper'

RSpec.describe TaskGoal, :type => :model do
  describe 'Associations' do
    it { should belong_to :goal }
    it { should belong_to :task }
  end
end
