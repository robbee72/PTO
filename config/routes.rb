Rails.application.routes.draw do

  resources :posts
  devise_for :users #, controllers: { :registrations => "registrations" }
  resources :users
  resources :calendars
  resources :events
  get 'about' => 'home#about'
  root :to =>'home#index'
end
