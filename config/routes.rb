Oceny::Application.routes.draw do
  root 'dashboard#index'

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

  get '/status' => 'status#check'

  get '/:permalink', to: 'forms#show', as: :form
  post '/:permalink/submit', to: 'forms#submit', as: :submit
  get '/:permalink/thanks', to: 'forms#thanks', as: :thanks
end
