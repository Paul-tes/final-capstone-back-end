Rails.application.routes.draw do


  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, # => this is the devise_for :users that is used for the api
                 controllers: {
                   registrations: "api/v1/users/registrations",
                   sessions: "api/v1/users/sessions",
                 },
                 path: "",
                 path_names: {
                   sign_in: "login",
                   sign_out: "logout",
                   registration: "signup",
                 }
    end
  end

  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get 'all', to: 'rooms#all'
        end
      end
      resources :reservations, only: [:index, :create, :destroy]
      resources :users, only: [:create, :index]
    end
  end
end
