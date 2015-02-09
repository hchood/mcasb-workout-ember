Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :exercises, only: [:index, :show]
      resources :workouts, only: [:index]
    end
  end
end
