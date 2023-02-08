Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :donuts, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
    resources :reviews, only: [:create]
  end
  # resources :orders, only: [:destroy]
end
