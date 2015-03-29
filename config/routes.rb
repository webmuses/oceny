Oceny::Application.routes.draw do
  root 'dashboard#index'

  resources :submissions do
    post :upload, on: :collection
  end

  namespace :api do
    resources :submissions, only: [:index, :show] do
      resources :rates, only: [:create]
      resources :comments, only: [:create]
    end

    resources :results, only: [:index]
    resource :form, only: [:show, :create, :update]
  end

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'

  get '/:permalink', to: 'forms#show'
end
