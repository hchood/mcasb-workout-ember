require 'rails_helper'
require 'api/v1/workouts_controller'

describe 'Workouts requests' do
  describe 'GET #index' do
    it 'renders json for all workouts, ordered by name' do
      last_workout = create(:workout, name: 'Vocal warmup')
      first_workout = create(:workout, name: 'Imagination series')
      middle_workout = create(:workout, name: 'Physical warmup')

      ordered_workouts = [first_workout, middle_workout, last_workout]
      serialized_workouts = ActiveModel::ArraySerializer.new(ordered_workouts,
        root: :workouts)

      get api_v1_workouts_path

      expect(response).to have_http_status(:ok)
      expect(json).to be_json_eq(serialized_workouts)
      expect(response).to match_response_schema('workouts')
    end
  end
end
