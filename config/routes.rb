Rails.application.routes.draw do  
	root 'welcome#index'
	get 'users' => 'users#index'  
end

