Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :habits
  resources :places do
    resources :notes, only: :create
  end
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
