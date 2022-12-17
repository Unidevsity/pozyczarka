# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :items do
    collection do
      get :active
      get :inactive
      get :borrowed
      get :on_place
    end
  end

  resources :friends, only: %i[index show] do
    member do
      get :items
      get :chat
    end
  end
  resources :invitations, only: %i[create] do
    member do
      post :accept
      post :reject
    end
  end

  resources :notifications, only: %i[index]
end
