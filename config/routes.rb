Rails.application.routes.draw do
  # get 'notes/index'
  # get 'notes/show'
  # get 'notes/new'
  # get 'notes/create'
  # get 'notes/edit'
  # get 'notes/update'
  # get 'notes/destroy'
  root "home#index"

  resources :notes
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
