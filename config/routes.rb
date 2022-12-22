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
    member do
      post :request_rent
      post :return_item
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

  resources :notifications, only: %i[index] do
    collection do
      get :all
    end
    member do
      post :mark_as_read
    end
  end

  resources :rental_requests, only: %i[] do
    member do
      post :accept
      post :reject
    end
  end
end
