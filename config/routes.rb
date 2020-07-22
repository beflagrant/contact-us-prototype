Rails.application.routes.draw do
  devise_for :admin_users, controllers: { omniauth_callbacks: 'admin/omniauth_callbacks' }
  devise_scope :admin_user do
    get 'admin/sign_in', to: 'admin/sessions#new', as: :new_admin_user_session
    get 'admin/sign_out', to: 'admin/sessions#destroy', as: :destroy_admin_user_session
  end
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
