Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create update destroy] do
        resources :sessions, only: %i[create]
      end
    end
  end
end
