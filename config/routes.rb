Rails.application.routes.draw do
  resources :accounts
  resources :transactions
  #resources :users
  resources :categories
  root 'welcome#index'
  get 'users' => 'users#new'
  post 'users' => 'users#create'
  get '/users/show' => 'users#show', as: :user
  get 'login/', to: 'login#index'
  post 'login/login', to: 'login#login'
  get 'login/forgot', to: 'login#forgot'
  post 'login/forgot', to: 'login#send_mail'
  get 'login/reset', to: 'login#new_password'
  post 'login/reset', to: 'login#set_password'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

