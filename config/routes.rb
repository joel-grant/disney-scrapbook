Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/rails/health" => "rails/health#show", as: :rails_health_check
  get "/rails/ready" => "rails/ready#show", as: :rails_ready_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "homepage#index"

  get "/register", to: "users#new", as: :new_user_registration
  resources :users, only: [ :create ]

  resources :dashboard, only: [ :index ]
end
