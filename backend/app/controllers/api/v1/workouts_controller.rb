class Api::V1::WorkoutsController < ApplicationController
  def index
    workouts = Workout.order(:name)

    render json: workouts
  end
end
