Rails.application.routes.draw do
	root 'posts#top'
	devise_for :users
	get 'users/about'
  resources :users,only:[:show,:edit,:update]
  resources :relationships, only:[:create,:destroy]
  resources :posts do
  	resources :comments, only:[:create,:destroy]
  end
  resources :likes,only:[:create,:destroy]
  resources :categories, only:[:create,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
