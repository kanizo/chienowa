Rails.application.routes.draw do
  get 'problems/create'
  get 'problems/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'toppages/index'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'editors/index'
  
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :problems, only: [:create, :destroy]
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :editors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
