Rails.application.routes.draw do
  root to: 'main#index'
  resources :details, only: [:index]
end
