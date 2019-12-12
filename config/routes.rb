Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :index]

  get :alllogs, to: "logs#index"
  get :logs, to: "logs#show"
  post :logs, to: "logs#create"
  patch :logs, to: "logs#edit"
  delete :logs, to: "logs#destroy"

  get :projects, to: "projects#show"
  post :projects, to: "projects#create"
  patch :projects, to: "projects#edit"
  delete :projects, to: "projects#destroy"

  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

end
