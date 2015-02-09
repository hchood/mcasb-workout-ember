FactoryGirl.define do
  factory :exercise do
    sequence(:name) { |n| "#{n} repetition" }
    description "Listen to your partner and repeat what they say."
  end
end
