Rails.application.routes.draw do
  root to: "home#index"

  resources :properties, only: [:show, :new, :create, :edit, :update] do
    get 'my_properties', on: :collection
  end

  resources :property_types, only: [:index, :new, :create, :show]

  resources :property_locations, only: [:index, :new, :create,  :show]

  devise_for :property_owners
end
