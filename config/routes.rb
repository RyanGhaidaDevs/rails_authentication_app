Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :index]
  get :logs, to: "logs#show"
  post :logs, to: "logs#create"
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

end
