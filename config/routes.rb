Oceny::Application.routes.draw do
  root 'forms#show'

  get '/dashboard' => 'dashboard#index'

  namespace :api do
    resources :submissions, only: [:index, :show] do
      resources :rates, only: [:create]
      resources :comments, only: [:create]
      collection do
        get :pending
      end
    end

    resources :results, only: [:index]
    resource :form, only: [:show, :create, :update]
  end

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'

  get '/status' => 'status#check'

  scope A9n.form_path do
    get '', to: 'forms#show', as: :form
    post '/submit', to: 'forms#submit', as: :submit
    get '/thanks', to: 'forms#thanks', as: :thanks
  end
end
