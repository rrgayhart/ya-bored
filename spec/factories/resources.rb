FactoryGirl.define do
  factory :resource do
    name 'resource'
  end

  factory :computer_resource, class: Resource do
    name 'computer'
  end
end
