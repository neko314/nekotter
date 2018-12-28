# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "top#index"
  # scope "(:locale)", locale: /en|nl/ do
  resources :users do 
    resources :tweets
  end
  # end
end
