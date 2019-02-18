# frozen_string_literal: true

Rails.application.routes.draw do

  resources :students do
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :students

end
