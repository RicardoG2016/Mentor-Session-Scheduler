Rails.application.routes.draw do

  devise_for :users, controllers: {
  	registrations: "users/registrations"
  }

  get "users/logout"

	# root "appointments#index"

  root "appointments#home"

	post "appointments/:id/signup" => 'appointments#signup'

	get 'users/show', to: 'users#show'

	delete '/appointments/:id' => 'appointments#destroy' 

  resources :appointments
end
