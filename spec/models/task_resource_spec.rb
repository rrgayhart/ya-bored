require 'rails_helper'

RSpec.describe TaskResource, :type => :model do
  describe 'Associations' do
    it { should belong_to :resource }
    it { should belong_to :task }
  end
end
