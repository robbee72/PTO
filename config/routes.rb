Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :calendars

  resources :events, :path => 'events'

  resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
