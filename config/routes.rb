Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :projects do
    resources :floors, only: [:create, :update]
  end
  resources :floors, only: [:destroy] do
    resources :plans, only: [:create, :update]
  end

  resources :plans, only: [:destroy] do
    resources :dots, only: [:create, :update]
  end

  resources :dots, only: :destroy do
    resources :tasks, only: [:create, :update, :edit]
  end

  resources :tasks, only: [:destroy, :index] do
    resources :user_tasks, only: [:create, :update]
  end

  resources :dots, only: :destroy
  resources :tasks, only: :destroy
  resources :user_tasks, only: :destroy
  resources :floors, only: :destroy
  resources :plans, only: :destroy
end
