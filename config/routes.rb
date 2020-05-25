Rails.application.routes.draw do
  root to: "scribe#index"
  resources :categories
end
