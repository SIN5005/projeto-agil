Rails.application.routes.draw do
  #resources :users
  resources :categories
  root 'welcome#index'
  get 'users' => 'users#new'
  post 'users' => 'users#create'
  get "/users/show" => "users#show", as: :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
