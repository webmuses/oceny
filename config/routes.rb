Oceny::Application.routes.draw do
  root 'dashboard#index'

  resources :attendees, only: [:index, :show] do
    post :upload, on: :collection

    resources :rates, only: [:create]
    resources :comments, only: [:create]
  end

  get '/results' => 'results#index'

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'
end
