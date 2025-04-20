Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :admin do
    resources :sections do
      resources :contents, except: [:index, :show]
    end
  end

  resources :sections, only: [:index, :show]
  resources :contents, only: [:show] do
    member do
      post :complete
    end
  end

  resources :subscriptions, only: [:new, :create, :show] do
    member do
      post :cancel
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
