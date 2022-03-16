Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top', as: 'root'
  get 'records/my_page' => 'records#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :records, only: [:new, :show]

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
