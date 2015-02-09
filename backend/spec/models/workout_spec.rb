require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'associations' do
    it { should have_many(:workout_exercises).dependent(:destroy) }
    it { should have_many(:exercises).through(:workout_exercises) }
  end
end
