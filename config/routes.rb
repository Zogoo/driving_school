Rails.application.routes.draw do
  root to: 'site#index'
  
  # OmniAuth callback controller
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

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
    resource :profile, except: [:destroy, :edit]
  end
  
  namespace :student do
    resources :my_page
    resources :bookings
    resources :lesson
    resource :profile, except: [:destroy, :edit]
  end
  
  namespace :operator do
  end

  resources :site, only: :index
end
