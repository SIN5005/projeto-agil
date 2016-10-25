Rails.application.routes.draw do  
  get 'category/create'

  get 'category/update'

  get 'category/delete'

  get 'category/list'

	root 'welcome#index'
	get 'users' => 'users#index'  
	post 'users' => 'users#create'
end

