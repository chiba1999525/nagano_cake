Rails.application.routes.draw do

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
       collection do
          get '/mypage' => 'customers#show'
          get '/confirm' =>  'customers#confirm'
          patch '/withdraw_processing' =>  'customers#withdraw_processing'
        end
    end
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only:[:index, :show, :new, :create ] do
      collection do
         post '/confirm' =>  'orders#confirm'
         get '/thank_you' =>  'orders#thank_you'
      end
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
