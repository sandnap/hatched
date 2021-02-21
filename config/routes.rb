# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  # , path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'dashboard#index'
  resources :users, only: %i[index edit update destory]
end
