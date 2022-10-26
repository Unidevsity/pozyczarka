# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :active
      get :inactive
      get :borrowed
      get :on_place
    end
  end
end
