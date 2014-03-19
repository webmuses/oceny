Oceny::Application.routes.draw do
  root 'dashboard#index'

  resources :attendees, only: [:index] do
    post :upload, on: :collection
    post :rate, on: :member
  end

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'
end
