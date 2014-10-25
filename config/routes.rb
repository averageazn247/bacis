Khoa::Application.routes.draw do
  
  ActiveAdmin.routes(self)

    namespace :mercury do
      resources :images
    end

  mount Mercury::Engine => '/'

  match "transactions/:action", :controller => 'transactions', :action => /[a-z]+/i
  resources :authentications
   
  resources :friends
  resources :posts
  resources :mails
  resources :pickups
  resources :events
  resources :drivers
  mount Mercury::Engine => '/'
match '/driver/new' , to: 'drivers#new' 
match '/driver/edit/:id' , to: 'drivers#edit'
match '/driver/show/:id' , to: 'drivers#show'
match '/drivers' , to: 'drives#index'

  match '/pickups/new', to: 'pickups#new'
   match '/pickups/edit/:id', to: 'pickups#edit'
    match '/pickups/show/:id', to: 'pickups#show'
  resources :events do
    member { put :mercury_update }
    end
  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                       controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
 
  root to: 'static_pages#home' 
  
  
  match '/myevents', to: 'events#myevent'
  match '/users/:id', to: 'users#show'
  match '/allusers', to: 'users#index'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/listevents', to: 'events#list'
  match '/calevents', to: 'events#cal'
  
  resources :users do
    member do
      get :borrows, :lends
    end
  end

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/help"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
