Rails.application.routes.draw do

  resources :calendars
  resources :events, :path => 'events'
  resources :posts
  resources :employees, only: [:new, :create]
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
