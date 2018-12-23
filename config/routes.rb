Rails.application.routes.draw do
  # get 'users/show'
  get 'profile', to: 'users#show', as: :profile
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  resources :habits
  resources :places do
    resources :reviews, only: :create
  end
  resources :notes
  resources :users, only: [:show, :edit, :update]
  # get "profile" => "users#show", :as => 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
