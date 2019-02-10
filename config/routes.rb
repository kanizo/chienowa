Rails.application.routes.draw do
  get 'lectures/index'
  get 'problems/create'
  get 'problems/destroy'
  get 'toppages/index'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'editors/index'
  get 'lectures/index'
  
  root to: 'toppages#index'

  post 'uploader/upload'

  get 'signup', to: 'users#new'
  resources :users
  resources :problems, only: [:create, :destroy]
  
  resources :editors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
