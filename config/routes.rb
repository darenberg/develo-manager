Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :projects do
    resources :rooms, only: [:create, :update]
    resources :project_members, only: [:create, :update]
  end

  resources :rooms, only: [:destroy] do
    resources :dots, only: [:create, :update]
  end

  resources :dots, only: :destroy do
    resources :notes, only: [:create, :update]
  end

  resources :project_admins, only: [:create, :update, :destroy]
  resources :project_members, only: :destroy
  resources :dots, only: :destroy
  resources :notes, only: :destroy
end
