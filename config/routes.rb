# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'students#index'
  resources :worksessions do
    get 'duplicate'
  end
  resources :students do
    collection { post :import }
  end
  resources :student_worksessions, only: [:destroy]
  get 'report', to: 'home#report'
  get 'home/index', to: "home#index"
  # Feature Appel
  get 'worksessions/:id/roll_call', to: 'student_worksessions#roll_call', as: 'worksession_roll_call'
  post 'worksessions/:id/roll_call', to: 'student_worksessions#update', as: 'update_worksession_roll_call'
end
