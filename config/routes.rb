Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
  	registrations: "users/registrations"
  }

  get "users/logout"

	root "appointments#index"

get 'users/show', to: 'users#show'

delete '/appointments/:id' => 'appointments#destroy' 

  resources :appointments
end
