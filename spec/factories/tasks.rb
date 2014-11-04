FactoryGirl.define do
  factory :task do
    name 'Call Grandma'
    site ''
    description 'Good for you'
    minutes 45
  end

  factory :computer_task, class: Task do
    name 'Inbox 0'
    site 'http://google.com'
    description 'Good for you'
  end
end
