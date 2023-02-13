Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :donuts, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
    resources :reviews, only: [:create]
  end
  resources :orders, only: [:index, :show]
  get :account, to: "pages#account"
  get :bakery, to: "pages#bakery"
end
