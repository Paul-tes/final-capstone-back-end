Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
      resources :rooms, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get 'all', to: 'rooms#all'
        end
      end
    end
  end
end
