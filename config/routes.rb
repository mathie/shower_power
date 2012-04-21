ShowerPower::Application.routes.draw do
  match '/application.manifest', to: 'appcache#index', format: :appcache
  match '/about', to: 'pages#about'
  root to: 'pages#index'
end
