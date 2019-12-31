Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  root 'places#index'
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  get '/search' => 'places#search', :as => 'search_places'
end
