Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:create]
  get 'tags/:tag', to: 'posts#index', as: "tag"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
