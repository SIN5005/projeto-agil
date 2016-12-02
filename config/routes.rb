Rails.application.routes.draw do  
	root 'welcome#index'
	get 'home' => 'welcome#home'
	get 'users' => 'users#index'
	get 'password' => 'users#password'
	post 'password' => 'users#change_password'
	post 'users' => 'users#create'	
	get 'login' => 'login#index'
	get 'logout' => 'users#logout'
	get 'menu' => 'layouts#menu'
	post 'login' => 'login#login'
	get 'transactions/new' => 'transactions#new'
	get 'accounts' => 'accounts#index'
	get 'accounts/new' => 'accounts#new'
	post 'accounts' => 'accounts#create'
	delete 'accounts/:id' => 'accounts#destroy', as: :account
	get 'categories' => 'categories#index'
	post 'categories' => 'categories#create'
end