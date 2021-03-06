Rails.application.routes.draw do  
	root 'welcome#index'
	get 'home' => 'welcome#home'
	get 'users' => 'users#index'
	get 'password' => 'users#password'
	post 'password' => 'users#change_password'
	post 'users' => 'users#create'	
	get 'login' => 'login#index'
	get 'logout' => 'users#logout'
	get 'forgot_password' => 'users#forgot_password'
	post 'forgot' => 'users#forgot'
	get 'menu' => 'layouts#menu'
	post 'login' => 'login#login'
	get 'transactions/new' => 'transactions#new'
	post 'transactions/' => 'transactions#create'
	get 'accounts' => 'accounts#index'
	get 'accounts/new' => 'accounts#new'
	post 'accounts' => 'accounts#create'
	delete 'accounts/:id' => 'accounts#destroy', as: :account
	get 'categories' => 'categories#index'
	get 'categories/new' => 'categories#new', as: :new_category
	post 'categories' => 'categories#create', as: :index_category
	get 'categories/:id/edit' => 'categories#edit', as: :edit_category
	get 'categories/:id/show' => 'categories#show', as: :category
	delete 'categories/:id'   => 'categories#destroy', as: :destroy_category
end
