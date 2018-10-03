Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'users#my_portfolio'
  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: "stocks#search"
  resources :user_stocks, only: [:create, :destroy]
  get 'my_friends', to: "users#my_friends"
  resources :users, only: [:show]
  resources :friendships
  get 'search_friends', to: 'users#search'
  post 'add-friend', to: 'users#add_friend'

end
