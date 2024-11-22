Rails.application.routes.draw do
  devise_for :users

  resources :courses do
    resources :lessons, only: [ :new, :create, :show ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], defaults: { commentable: "Lesson" }
    end
    resources :assignments, only: [ :index, :show, :new, :create ] do
      resources :comments, only: [ :create, :edit, :update, :destroy ], defaults: { commentable: "Assignment" }
      resources :likes, only: [ :create, :destroy ], defaults: { likeable_type: "Assignment" }
    end
  end

  post "courses/:id/join", to: "courses#join", as: :join_course


  # namespace :admin do
  #   # post "users/:id", to: "admin#delete_user", as: :destroy_user
  # end
  get "admin/dashboard" => "admin#dashboard"
  get "admin/index" => "admin#index"

  resources :users, only: [ :index, :show, :destroy ] do
    member do
      patch :change_role
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "static_pages#home"
  get "about" => "static_pages#about"
  get "faq" => "static_pages#faq"
  get "help" => "static_pages#help"
end
