Rails.application.routes.draw do
  devise_for :users

  resources :posts, except: [:delete]
  resources :comments
root to: 'posts#index'
end
