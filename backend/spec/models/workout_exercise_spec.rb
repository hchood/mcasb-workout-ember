require 'rails_helper'

RSpec.describe WorkoutExercise, type: :model do
  describe 'validations' do
    let!(:workout_exercise) { create(:workout_exercise) }

    it { should validate_presence_of :workout }
    it { should validate_presence_of :exercise }
    it { should validate_uniqueness_of(:workout).scoped_to(:exercise_id) }
  end

  describe 'associations' do
    it { should belong_to :workout }
    it { should belong_to :exercise }
  end
end
