Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/users/profile/:id" => 'users#profile'
  get "/users/show" => 'users#show'
  resources :posts, except: [:delete]
  resources :comments
  resources :votes
root to: 'posts#index'
end
