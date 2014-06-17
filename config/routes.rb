Oceny::Application.routes.draw do
  root 'dashboard#index'

  resources :attendees do
    post :upload, on: :collection
  end

  namespace :api do
    resources :attendees, only: [:index, :show] do
      resources :rates, only: [:create]
      resources :comments, only: [:create]
    end

    resources :results, only: [:index]
    resources :forms, only: [:index]
  end

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'
end
