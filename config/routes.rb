Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      get '/current_user', to: "auth#show"
      post '/login', to: "auth#create"
    end
  end

  resources :slangs
  resources :likes
  resources :liked_slangs, only: [:index, :create, :destroy]

  get '/:username/slangs', to: "slangs#user_slangs"
  get '/slang/:term', to: "slangs#search"
  get '/:username/likes', to: 'likes#user_likes'

end
