Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
  post 'topics/edit' => 'topics#edit'
    # root to: 'people#edit'


  resources :topics, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :people, only: [:show, :edit, :update]

end
