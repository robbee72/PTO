Rails.application.routes.draw do

  resources :calendar, only: [:show]
  resources :events, :path => 'events'
  resources :posts
  resources :employees, only: [:new, :create]
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
