Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get 'all', to: 'rooms#all'
        end
      end
      resources :users, only: [:create, :index]
    end
  end
end
