Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  get 'lectures', to: 'lectures#index'
  get 'toppages', to: 'toppages#index'

  resources :likes, only: [:create, :destroy]
  root to: 'toppages#index'

  post 'uploader/upload'

  resources :problems, only: [:create, :destroy]
  
  resources :editors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
