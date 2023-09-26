Rails.application.routes.draw do
  devise_for :users
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
