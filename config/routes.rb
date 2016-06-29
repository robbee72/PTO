Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :calendars

  resources :events

  resources :sessions
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
