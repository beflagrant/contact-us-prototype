Rails.application.routes.draw do
  namespace :admin do
    resources :cases, only: [:index, :show, :destroy]  do
      resources :messages, only: [:create, :edit, :update]
    end
    resources :intakes, only: [:index, :show]
  end

  resources :intakes, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#index"
end
