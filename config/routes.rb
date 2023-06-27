Rails.application.routes.draw do
   devise_for :users
  
  resources :users
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    #books(投稿)に対してコメントをするからコメントのモデルを親子関係にする
  end

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
