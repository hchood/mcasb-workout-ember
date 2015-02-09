class Api::V1::ExercisesController < ApplicationController
  def index
    exercises = Exercise.order(:name)

    render json: exercises
  end

  def show
    exercise = Exercise.find(params[:id])

    render json: exercise
  end
end
