Rails.application.routes.draw do
  namespace :admin do
    resources :cases do
      resources :messages, only: [:create, :edit, :update]
    end
  end

  resources :intakes, only: [:index, :new, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
