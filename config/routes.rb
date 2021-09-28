# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root to: 'minesweeper#index'

  namespace :api do
    namespace :v1 do
      resources :games, only: %i[index show create update]
    end
  end
end
