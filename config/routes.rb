Rails.application.routes.draw do  
	root 'welcome#index'
	get 'home' => 'welcome#home'
	get 'users' => 'users#index'
	post 'users' => 'users#create'
	get 'login' => 'login#index'
	post 'login' => 'login#login'
	get 'transactions/new' => 'transactions#new'
	get 'accounts' => 'accounts#index'
end

