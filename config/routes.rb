Rails.application.routes.draw do
  root 'pages#home'
  resources :carpools
  resources :housings
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'whyus', to: 'pages#whyus'
  get 'contactus', to: 'pages#contactus'
  get 'team', to: 'pages#team'
end
