Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create update destroy], param: :uid do
        resources :likes, only: %i[index], module: :users
        resources :reports, only: %i[index], module: :users
      end
      resource :sessions, only: %i[create]

      resources :shops, only: %i[index], param: :hotpepper_id do
        resources :likes, only: %i[create destroy], module: :shops
        resources :reports, only: %i[create destroy], module: :shops
      end
    end
  end
end
