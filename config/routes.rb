Rails.application.routes.draw do
  devise_for :users
  get "/users/profile/:id" => 'users#profile'
  get "/users/show" => 'users#show'
  resources :posts, except: [:delete]
  resources :comments
  resources :votes
root to: 'posts#index'
end
