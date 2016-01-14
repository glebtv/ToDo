Rails.application.routes.draw do

  devise_for :users

  resources :tasks
  resources :users, only: [:index, :show]

  root 'tasks#index'
end
