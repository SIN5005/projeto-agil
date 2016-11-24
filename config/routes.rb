Rails.application.routes.draw do  
	root 'welcome#index'
	get 'users' => 'users#index'
	post 'users' => 'users#create'
	get 'login' => 'login#index'
	post 'login' => 'login#login'
	get 'transactions/new' => 'transactions#new'
end

