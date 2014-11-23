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

  describe 'Scopes' do
    describe 'active' do
      let!(:active_task){ create(:task, completed: false) }
      let!(:completed_task){ create(:task, completed: true) }

      it 'returns companies not marked complete' do
        expect(described_class.active.count).to eq(1)
        expect(described_class.active.first).to eq(active_task)
      end
    end

  end

  context 'Methods' do
    let(:goal){create(:goal)}
    let(:resource){create(:computer_resource)}

    describe 'fart_around' do

      it 'should pull a computer task' do
        create(:task, goals: [goal], resources: [resource])
        computer_task = create(:computer_task, goals: [goal], resources: [resource])
        expect(Task.fart_around).to eq(computer_task)
      end

      it 'should only pull a 15 minute or under task' do
        long_task = create(:computer_task, goals: [goal], resources: [resource], minutes: 16)
        short_task = create(:computer_task, goals: [goal], resources: [resource], minutes: 15)
        expect(Task.fart_around).to eq(short_task)
      end

      it 'should pull a task without resources' do
        other_resource = create(:resource)
        none_resource = create(:resource, name: 'none')
        other_resource_task = create(:task, goals: [goal], resources: [other_resource], minutes: 15)
        no_resource_task = create(:task, goals: [goal], resources: [none_resource], minutes: 15)
        expect(Task.fart_around).to eq(no_resource_task)
      end
    end

    describe 'select_a_set' do
      let!(:phone_resource){create(:resource)}
      let!(:other_resource){create(:resource)}
      let!(:short_walk){create(:task, minutes: 15, resources: [other_resource])}

      context 'given one resource' do
        let!(:short_phone_call){create(:task, minutes: 15, resources: [phone_resource])}
        let!(:long_phone_call){create(:task, minutes: 45, resources: [phone_resource])}

        it 'pulls a task under the alloted minutes' do
          select_a_set_task = Task.select_a_set({ minutes: 15}, [phone_resource.id.to_s])
          expect(select_a_set_task).to eq(short_phone_call)
        end

        it 'pulls a task including the selected resource' do
          select_a_set_task = Task.select_a_set({ minutes: 60 }, [other_resource.id.to_s])
          expect(select_a_set_task).to eq(short_walk)
        end
      end

      context 'given multiple resources' do
        it 'does not ignore tasks that match only one provided resource' do
          select_a_set_task = Task.select_a_set({ minutes: 15}, [phone_resource.id.to_s, other_resource.id.to_s])
          expect(select_a_set_task).to eq(short_walk)
        end
      end
    end
  end
end
