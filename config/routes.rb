Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      get '/current_user', to: "auth#show"
      post '/login', to: "auth#create"
    end
  end

  get '/slang/:term', to: "slangs#search"

end
