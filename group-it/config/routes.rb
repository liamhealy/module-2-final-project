Rails.application.routes.draw do
  resources :groups do
    resources :notes do
      resources :comments
    end
  end
  resources :users
  resources :group_members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
