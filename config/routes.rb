Rails.application.routes.draw do
  root to: 'home#index'
  get '*path', to: 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  use_doorkeeper
  use_doorkeeper_openid_connect
  resources :my_page
end
