Rails.application.routes.draw do
  devise_for :users
    root to: "home#index"

    resources :properties, only: [:show, :new, :create, :edit, :update]

    resources :property_types, only: [:index, :new, :create, :show]

    resources :property_locations, only: [:index, :new, :create,  :show]
end