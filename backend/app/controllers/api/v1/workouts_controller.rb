class Api::V1::WorkoutsController < ApplicationController
  def index
    workouts = Workout.order(:name)

    render json: workouts
  end

  def show
    workout = Workout.includes(:exercises).find(params[:id])

    render json: workout, include: [:exercises]
  end
end
