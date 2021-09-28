Rails.application.routes.draw do
    root to: "home#index"

    resources :properties, only: [:show, :new, :create]

    resources :property_types, only: [:index, :new, :create, :show]

    resources :property_locations, only: [:index, :new, :create,  :show]
end