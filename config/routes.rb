Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
  	registrations: "users/registrations"
  }

  get "users/logout"

	root "appointments#index"

	post "appointments/:id/signup" => 'appointments#signup'

  resources :appointments
end
