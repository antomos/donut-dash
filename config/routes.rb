Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :donuts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:new, :create, :new, :update]
    resources :reviews, only: [:new, :create]
    resources :donut_tags, only: [:new, :create]
  end

  resources :donut_tags, only: [:destroy]

  resources :orders, only: [:index, :show]

  get :account, to: "pages#account"
  get :bakery, to: "pages#bakery"
  get :archived, to: "pages#archived"
end
