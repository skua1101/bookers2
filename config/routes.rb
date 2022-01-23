Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'=> 'homes#about',as: 'about'
  resources :users, only: [:index, :show, :edit, :update]do
  end
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  end  #本の投稿
end