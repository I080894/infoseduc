ActionController::Routing::Routes.draw do |map|
  map.resources :itinerarios

  map.resources :chamados

  map.resources :situacao_chamados

  map.resources :tipos_problemas

  map.resources :fornecedores

  map.resources :componentes

  map.resources :relatorios

  map.resources :saidas

  map.resources :entradas

  map.resources :estoques

  map.resources :senhas

  map.resources :tipos

  map.resources :seducs

  map.resources :departamentos

  map.resources :seduc

  map.resources :administracaos

  map.resources :laboratorios

  map.resources :estagiarios

  map.resources :impressoras
  
  map.resources :computadores

  map.resources :unidades

  map.resources :users

  map.resource :session

  map.resources :roles_users
  
  map.resources :homes
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => 'homes', :action => 'index'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.resources :fornecedores
  map.consulta '/consultas', :controller => 'fornecedores', :action => 'consulta'
  map.sem_estagiario '/sem_estagiario', :controller => 'unidades', :action => 'sem_estagiarios'
  map.baixas '/baixas', :controller => 'estagiarios', :action => 'baixas'
  map.analistas '/analistas', :controller => 'estagiarios', :action => 'analistas'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
