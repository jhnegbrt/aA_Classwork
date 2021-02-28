Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, :toys, :categories

  resources :categories do
    resources :toys, only: [:index]
  end
  
end
