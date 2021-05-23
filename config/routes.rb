Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create update destroy], param: :uid do
        resources :likes, only: %i[index destroy], module: :users
        resources :reports, only: %i[index destroy], module: :users
      end
      resource :sessions, only: %i[create]

      namespace :shops do
        post '/check_likes' => 'likes#index'
        resources :likes, only: %i[create destroy]
        resources :reports, only: %i[index create destroy]
      end
    end
  end
end
