Rails.application.routes.draw do

  root to: 'homes#top'

  namespace :admin do
    root 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update, :new]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :orders_details, only:[:update]
  end

  namespace :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update] do
        get '/customers/confirm' =>  'public/customers#cunfirm'
        get '/customers/withdraw_processing' =>  'public/customers#withdraw_processing'
    end
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only:[:index, :show, :new, :create, :confirm, :thank_you] do
       get 'customers/cofirm' =>  'public/orders#confirm'
       get 'customers/thank_you' =>  'public/orders#thank_you'
    end
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, controllers: {
   sessions: 'admin/sessions'
  }

end
