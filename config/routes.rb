Rails.application.routes.draw do
  root to: 'home#index'
  
  # Deep customized devise controllers
  devise_scope :user do
    get 'users/login', to: 'users/sessions#new'
    post 'users/login', to: 'users/sessions#create'
    delete 'users/logout', to: 'users/sessions#destroy'
    get 'users/register', to: 'users/registrations#new'
    post 'users/register', to: 'users/registrations#create'
    get 'users/password', to: 'users/passwords#new'
    post 'users/password', to: 'users/passwords#create'
    get 'users/password/reset', to: 'users/passwords#edit'
    put 'users/password', to: 'users/passwords#update'
    get 'users/confirmation/new', to: 'users/confirmations#new'
    get 'users/confirmation', to: 'users/confirmations#show'
    post 'users/confirmation', to: 'users/confirmations#create'
    get '/users/unlock/new', to: 'users/unlocks#new'
    get '/users/unlock', to: 'users/unlocks#show'
    post '/users/unlock', to: 'users/unlocks#create'
  end

  # OmniAuth callback controller
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end
  
  scope :operator do
    use_doorkeeper do
      # mount OAuth clients CRUD only: /operator/oauth/applications
      skip_controllers :authorized_applications, :authorizations, :tokens, :token_info
    end
  end

  use_doorkeeper_openid_connect
  
  namespace :teacher do
    resources :my_page
  end
  
  namespace :student do
    resources :my_page
  end
  
  namespace :operator do
  end
end
