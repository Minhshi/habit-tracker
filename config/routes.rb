Rails.application.routes.draw do
  get 'users/show'
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  resources :habits
  resources :places do
    resources :reviews, only: :create
  end
  resources :notes
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
