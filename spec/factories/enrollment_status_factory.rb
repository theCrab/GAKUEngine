FactoryGirl.define do
  factory :enrollment_status do
    association(:enrollment_status_type)
    association(:student)
  end
end