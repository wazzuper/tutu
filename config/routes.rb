Rails.application.routes.draw do
  devise_for :users

  resources :tickets, except: [:edit, :update]
  resource :search, only: [:show, :create]

  namespace :admin do
    resources :routes

    resources :trains do
      resources :wagons, shallow: true
      resources :coupe_wagons, shallow: true, controller: 'wagons'
      resources :economy_wagons, shallow: true, controller: 'wagons'
      resources :sw_wagons, shallow: true, controller: 'wagons'
      resources :sitting_wagons, shallow: true, controller: 'wagons'
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resources :tickets
  end

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
