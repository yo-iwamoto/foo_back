Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create update destroy]
      resource :sessions, only: %i[create]

      namespace :users do
        resources :likes, only: %i[index destroy]
        resources :reports, only: %i[index destroy]
      end

      namespace :shops do
        post '/check_likes' => 'likes#index'
        resources :likes, only: %i[create destroy]
        resources :reports, only: %i[index create destroy]
      end
    end
  end
end
