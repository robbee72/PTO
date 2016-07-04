Rails.application.routes.draw do

  resources :posts
  devise_for :users
  resources :users
  resources :calendars
  resources :events

  get 'about' => 'home#about'
  root :to =>'home#index'

end
