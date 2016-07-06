Rails.application.routes.draw do

  devise_for :users
  resources :mailer_users
  resources :posts
  # devise_for :users
  # devise_scope :user do
#   get 'sign_in', to: 'devise/sessions#new'
# end
  # resources :users
  resources :calendars
  resources :events

  get 'about' => 'home#about'
  root :to =>'home#index'

end
