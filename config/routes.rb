Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  get 'blogs/index'
  root 'blogs#index'
  resources :blogs do
    resources :posts do
      resources :comments
    end
  end

  authenticated do
    root to: "blogs#index", as: :authenticated_root
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
