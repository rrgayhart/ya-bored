require 'rails_helper'

RSpec.describe Goal, :type => :model do
  describe 'Validations' do
    it { should validate_presence_of :key_name }
  end
end
