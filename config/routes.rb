Rails.application.routes.draw do

  devise_for :users
  resources :posts

  resources :calendars
  resources :events

  get 'about' => 'home#about'
  root :to =>'home#index'

  resources :users do
    resources :calendars
    resources :events
  end

end
