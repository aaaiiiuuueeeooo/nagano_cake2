Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
scope module: :public do
root to: 'homes#top'
  get 'homes/top'
  get 'about' => 'homes#about'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  get 'customers/withdraw' => 'customers#withdraw'
  get 'orders/complete' => 'orders#complete'
  delete 'destroy_all' => 'cart_items#destroy_all'
  post 'confilm' => 'orders#confilm'
  get 'complete' => 'orders#complete'
  resources :items, only:[:index, :show]
  resources :customers, only:[:show, :edit, :update]
  resources :cart_items, only:[:index, :create, :update, :destroy]
  resources :orders, only:[:new, :index, :show, :create]
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
end
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :items, only:[:index, :new, :show, :edit, :create, :update]

    resources :seesions, only:[:new, :create, :destroy]

    resources :genres, only:[:index, :edit, :create, :update]

    resources :customers, only:[:index, :show, :edit, :update]

    resources :orders, only:[:show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
