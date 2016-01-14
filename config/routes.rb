Rails.application.routes.draw do

  devise_for :users,  controllers: { registrations: 'registrations' }

  resources :tasks
  resources :users, only: [:index, :show]

  root 'tasks#index'
end
