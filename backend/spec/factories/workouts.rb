FactoryGirl.define do
  factory :workout do
    sequence(:name) { |n| "#{n} - vocal warmup" }
    description 'A series of Linklater exercises.'
  end
end
