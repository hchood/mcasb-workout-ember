class Api::V1::ExercisesController < ApplicationController
  def index
    exercises = Exercise.order(:name)

    render json: exercises
  end
end
