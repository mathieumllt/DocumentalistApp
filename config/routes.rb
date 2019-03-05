# frozen_string_literal: true

Rails.application.routes.draw do
  resources :worksessions do
    get 'duplicate'
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :students do
    collection { post :import }
  end
  get 'report', to: 'home#report'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'students#index'
  get 'home/index', to: "home#index"
end
