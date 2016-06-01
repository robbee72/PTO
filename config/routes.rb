Rails.application.routes.draw do

  resources :calendar, only: [:new, :create, :show, :destroy]


  resources :events, :path => 'events'
  resources :posts
  resources :employees, only: [:new, :create]
  get 'about' => 'welcome#about'
  root :to =>'welcome#index'
end
