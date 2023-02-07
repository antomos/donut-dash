Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :donuts, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index, :show]
end
