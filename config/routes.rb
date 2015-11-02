Rails.application.routes.draw do
  devise_for :users
  get "/users/profile/:id" => 'users#profile'
  resources :posts, except: [:delete]
  resources :comments
  resources :votes
root to: 'posts#index'
end
