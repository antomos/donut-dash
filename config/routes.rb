Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :donuts, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
    resources :reviews, only: [:index, :show, :new, :create]
  end
  resources :orders, only: [:index, :show]
  #### DECA: I MOVED THESE ABOVE CAUSE WE ONLY CARE ABOUT A GIVEN DONUT'S REVIEWS ####
  #### ...AND WE WOULD FIND A REVIEW ONLY THROUGH THE DONUT IT BELONGS TO ####
  # resources :reviews, only: [:index, :show]
end
