Oceny::Application.routes.draw do
  root 'dashboard#index'

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'
end
