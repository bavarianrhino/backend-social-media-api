Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # Created namespaces for integration of future api versions.
    # Also, for early stage development I open up all routes for debugging purposes.
    namespace :api do
        namespace :v1 do
            # resources :users, only: [:index, :create, update, destroy]
            resources :users
            resources :posts
            resources :comments
            resources :ratings
            resources :comments
        end
    end
end
