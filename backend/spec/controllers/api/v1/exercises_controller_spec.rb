require 'rails_helper'

RSpec.describe Api::V1::ExercisesController, type: :controller do
  describe "GET #index" do
    it "displays all exercises, ordered by name" do
      last_exercise = create(:exercise, name: "Repetiion")
      first_exercise = create(:exercise, name: "Centers")
      middle_exercise = create(:exercise, name: "Imagination Box")

      ordered_exercises = [first_exercise, middle_exercise, last_exercise]
      serialized_exercises = ActiveModel::ArraySerializer.new(ordered_exercises,
        root: :exercises)

      get :index

      expect(response.status).to eq 200
      expect(json).to be_json_eq(serialized_exercises)
    end
  end
end
