FactoryGirl.define do
  factory :task_resource do
    association :task
    association :resource
  end

end
