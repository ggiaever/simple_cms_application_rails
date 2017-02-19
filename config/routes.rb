Rails.application.routes.draw do


  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  resources :admin_users do
    member do
      get :delete
    end
  end

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  # default route
  # may go away in future versions of Rails
  # get ':controller(/:action(/:id))'

  # get 'admin_user/index'
  #
  # get 'admin_user/new'
  #
  # get 'admin_user/create'
  #
  # get 'admin_user/edit'
  #
  # get 'admin_user/update'
  #
  # get 'admin_user/delete'
  #
  # get 'admin_user/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
