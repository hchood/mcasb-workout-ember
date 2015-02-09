FactoryGirl.define do
  factory :workout_exercise do
    association :workout
    association :exercise
  end
end
