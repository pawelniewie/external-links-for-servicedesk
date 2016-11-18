Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/descriptor', to: 'descriptor#show', defaults: { format: :json }
  post '/installed', to: 'lifecycle#installed'
  post '/uninstalled', to: 'lifecycle#uninstalled'

  resources :projects, only: [] do
    resources :service_links
  end
end
