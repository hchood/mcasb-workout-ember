require 'rails_helper'
require 'api/v1/exercises_controller'

describe 'Exercises requests' do
  describe 'GET #index' do
    it 'renders json for all exercises, ordered by name' do
      last_exercise = create(:exercise, name: 'Repetiion')
      first_exercise = create(:exercise, name: 'Centers')
      middle_exercise = create(:exercise, name: 'Imagination Box')

      ordered_exercises = [first_exercise, middle_exercise, last_exercise]
      serialized_exercises = ActiveModel::ArraySerializer.new(ordered_exercises,
        root: :exercises)

      get api_v1_exercises_path

      expect(response).to have_http_status(:ok)
      expect(json).to be_json_eq(serialized_exercises)
      expect(response).to match_response_schema('exercises')
    end
  end

  describe 'GET #show' do
    it 'renders json for an exercise' do
      exercise = create(:exercise)

      get api_v1_exercise_path(exercise)

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema(:exercise)
    end
  end
end
