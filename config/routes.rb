Rails.application.routes.draw do


  resources :calendars 
  resources :events, :path => 'events'

  resources :employees, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
