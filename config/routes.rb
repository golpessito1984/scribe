Rails.application.routes.draw do
  root to: "scribe#index"
  resources :categories, only: %i[index new create show]
end
