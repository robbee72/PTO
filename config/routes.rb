Rails.application.routes.draw do

  resources :posts
  devise_for :users #, controllers: { :registrations => "registrations" }

  resources :users
  resources :calendars

  resources :events
  # resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'home#about'
  root  'home#index'
end
