FactoryGirl.define do
  factory :task_goal do
    association :task
    association :goal
  end
end
