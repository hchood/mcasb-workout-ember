class WorkoutExercise < ActiveRecord::Base
  validates :workout,
    presence: true,
    uniqueness: { scope: :exercise_id }
  validates :exercise, presence: true

  belongs_to :workout
  belongs_to :exercise
end
