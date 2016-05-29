Rails.application.routes.draw do

  resources :employees, only: [:new, :create]
  get 'welcome/index'

  get 'welcome/about'
  root 'welcome#index'
end
