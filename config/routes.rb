Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create update destroy] do
        resources :reports, only: %i[index create destroy]
        resources :likes, only: %i[index create destroy]
      end
      resource :sessions, only: %i[create]
      resources :shops, only: %i[create]
    end
  end
end
