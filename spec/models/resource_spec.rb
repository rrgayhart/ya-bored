require 'rails_helper'

RSpec.describe Resource, :type => :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe 'Associations' do
    it { should have_many :task_resources }
    it { should have_many(:tasks).through(:task_resources) }
  end
end
