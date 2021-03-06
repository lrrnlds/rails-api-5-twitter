Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json } do
    get 'tweets/recent', to: 'tweets#recent'
    resources :users, except: [:index] do
      get 'tweets/search/:keyword', to: 'tweets#search'
      post 'tweets', to: 'tweets#create'
    end
    resource :login, only: [:create], controller: :sessions
    get 'hashtags/popular', to: 'hashtags#popular'
  end
end
