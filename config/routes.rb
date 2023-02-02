Rails.application.routes.draw do
  root 'statics#top'
  get :dashboard, to: 'teams#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resource :user
  
  resources :teams do
    member do
      patch :changeowner
    end
    resources :assigns, only: %w(create destroy)
    resources :agendas, shallow: true do
      resources :articles do
        resources :comments
    end
    member do
      post :assign_owner
    end
  end
end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
