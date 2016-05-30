Rails.application.routes.draw do
  resources :posts
  resources :employees, only: [:new, :create]
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
