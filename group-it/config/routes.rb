Rails.application.routes.draw do
  resources :groups do
    resources :notes do
      resources :comments
    end
  end
  resources :users, only: [:show, :create, :edit, :update]
  resources :group_members

  # Sessions and user signup/login:
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'sessions', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
