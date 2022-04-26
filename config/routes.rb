Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
      resources :users, only: [:index, :create, :update, :destroy]
      resources :education_modules, only: [:index, :create, :update]
      resources :food_journals, only: [:index, :create, :update]
      resources :pain_journals, only: [:index, :create, :update, :destroy]
      resources :mood_journals, only: [:index, :create, :update, :destroy]
    end
  end

  get '*path', to: 'pages#index', via: :all
  #handle routing through react without conflicting with api
end
