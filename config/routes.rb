Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :projects
  resources :dots, only: [:create, :update, :destroy]
  resources :rooms, only: [:create, :update, :destroy]
  resources :notes, only: [:create, :update, :destroy]
  resources :project_members, only: [:create, :update, :destroy]
  resources :project_admins, only: [:create, :update, :destroy]
end
