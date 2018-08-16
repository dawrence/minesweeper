# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'urls#index'

  get ':url', to: 'urls#visit', as: :visit

  namespace :api do
    namespace :v1 do
      resources :urls, only: %i[create show], param: :url
      get 'latest', to: 'urls#latest'
      get 'stats/:url', to: 'urls#stats'
    end
  end
end
