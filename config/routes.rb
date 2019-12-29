Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  resources :places do
    resources :photos, only: :create
  end
  get '/search' => 'places#search', :as => 'search_places'
end
