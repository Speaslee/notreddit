Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/users/profile/:id" => 'users#profile'
  get "/users/show" => 'users#show'
  patch "/users/profile/:id" => 'users#picture'
  resources :posts, except: [:delete]
  resources :comments
  resources :votes
  resources :tags, only:[:index, :show]
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  root to: 'posts#index'
end
