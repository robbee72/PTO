Rails.application.routes.draw do

  devise_for :users
  resources :users
  resource :calendar

  resources :events

  resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
