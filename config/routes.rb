Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  post 'tweets' => 'tweets#create'

  get 'users/index'
  get 'users/show/:username' => 'users#show'
end
