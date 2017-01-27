Rails.application.routes.draw do
  resources :wagons
  resources :coupe_wagons, controller: 'wagons'
  resources :economy_wagons, controller: 'wagons'
  resources :sw_wagons, controller: 'wagons'
  resources :sitting_wagons, controller: 'wagons'
  resources :users
  resources :tickets
  resources :routes
  resources :trains
  resources :railway_stations do
    patch :update_position, on: :member
  end
  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
