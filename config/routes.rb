Rails.application.routes.draw do
  get 'room_users/index'
  get 'rooms/index'
  get 'users/account'
  get 'rooms/posts'
  get 'rooms/search'
  devise_for :users
  root 'users#index'
  resources :users
  resources :rooms
  resources :room_users

  # Rails.application.routes.draw do
  #   devise_for :users
  # end

  # devise_for :users,controllers: {

  # }

  # devise_scope :user do
  #   get '/user/sign_out' => 'devise/session#index'
  #   post '/user/' => 'users/registrations#users_account'
  # end
end
