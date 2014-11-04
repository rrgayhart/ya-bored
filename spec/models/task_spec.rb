require 'rails_helper'

RSpec.describe Task, :type => :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe 'Associations' do
    it { should have_many :task_resources }
    it { should have_many(:resources).through(:task_resources) }
    it { should have_many :task_goals }
    it { should have_many(:goals).through(:task_goals) }
  end

  describe 'fart_around' do
    let(:resource){create(:computer_resource)}
    let(:goal){create(:goal)}
    let!(:computer_task){create(:computer_task, goals: [goal], resources: [resource])}

    let(:regular_task){create(:task, goals: [goal], resources: [resource])}

    it 'should pull a computer task' do
      5.times do
        expect(Task.fart_around).to eq(computer_task)
      end
    end

    it 'should pull a 15 minute or under task' do
      create(:computer_task, goals: [goal], resources: [resource], minutes: 16)
      5.times do
        expect(Task.fart_around).to eq(computer_task)
      end
    end
  end
end
