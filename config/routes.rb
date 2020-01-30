Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'albums/index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'api/v1/artists#index', format: 'json'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      root to: 'artists#index'
      resources :artists do
        # resources :albums
        collection do
          get ':id/albums' => 'artists#albums'
        end
      end
      resources :albums do
        resources :songs
      end
      resources :genres do
        # get 
      end
    end
  end
end
