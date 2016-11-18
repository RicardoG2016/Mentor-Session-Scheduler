Rails.application.routes.draw do

  devise_for :users, controllers: {
  	registrations: "users/registrations"
  }

  get "users/logout"

	# root "appointments#index"

  root "appointments#home"

	post "appointments/:id/signup" => 'appointments#signup'

  get 'appointments/index' => 'appointments#index'

	get 'users/show', to: 'users#show'

	delete '/appointments/:id' => 'appointments#destroy' 

  get '/reviews/:id/new' => 'reviews#new'

  post '/reviews/:id/new' => 'reviews#create'

  resources :appointments

end
