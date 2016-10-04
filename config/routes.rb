Rails.application.routes.draw do
  get 'login/', to: 'login#index'
  post 'login/login', to: 'login#login'

  resources :users
  resources :categories
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
