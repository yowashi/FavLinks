Rails.application.routes.draw do
	root 'posts#top'
  devise_for :users
  resources :users,only:[:show,:edit,:update]
  resources :relationships, only:[:create,:destroy]
  resources :posts
  resources :likes,only:[:create,:destroy]
  resources :category, only:[:new,:create,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
