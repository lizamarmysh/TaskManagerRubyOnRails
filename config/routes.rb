Rails.application.routes.draw do
	root 'users#sign_in', as: 'home'
	#root 'tasks#index', as: 'home'
	resources :tasks
	resources :users

end
