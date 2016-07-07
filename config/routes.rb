Rails.application.routes.draw do

  devise_for :users
  resources :mailer_users
  resources :posts

  resources :calendars
  resources :events

  get 'about' => 'home#about'
  root :to =>'home#index'

end
