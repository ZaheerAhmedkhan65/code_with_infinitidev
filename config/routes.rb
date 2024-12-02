Rails.application.routes.draw do
  resources :help_requests
  devise_for :users

  resources :code_snippets, only: [ :new, :create, :edit, :update ] do
    member do
      get :preview
    end
  end

  resources :courses do
    resources :lessons, only: [ :new, :create, :show, :edit, :update, :destroy ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], defaults: { commentable: "Lesson" }
      resources :likes, only: [ :create, :destroy ], defaults: { likeable_type: "Lesson" }
    end
    resources :assignments, only: [ :index, :show, :new, :create, :edit, :update, :destroy ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], defaults: { commentable: "Assignment" }
      resources :likes, only: [ :create, :destroy ], defaults: { likeable_type: "Assignment" }
    end
  end

  post "courses/:id/join", to: "courses#join", as: :join_course

  # Admin routes
  get "admin/dashboard" => "admin#dashboard"
  get "admin/index" => "admin#index"

  resources :users, only: [ :index, :show, :destroy ] do
    member do
      patch :change_role
    end
  end

  # Define health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Static pages routes
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "faq" => "static_pages#faq"
  get "help" => "static_pages#help"
end
