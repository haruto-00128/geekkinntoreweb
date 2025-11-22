Rails.application.routes.draw do
  get "diagnoses/new"
  get "diagnoses/create"
  
devise_for :users  # ← これを必ず最初の方に追加！

resources :users, only: [:show]

resources :posts

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'

resources :tweets

resources :diagnoses, only: [:new, :create, :show] do
  post :save, on: :collection
end

root 'hello#index'

end
