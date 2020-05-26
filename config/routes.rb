Rails.application.routes.draw do
  root to: "scribe#index"
  resources :categories
  resources :users, only: %i[index show create destroy update edit]
  resource :session
  # User routes
  get '/signup' => 'users#new'
end
