Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notebooks do
    resources :notes, shallow: true
  end

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/auth/:provider', to: lambda{|env| [404, {}, ["Not Found"]]}, as: 'auth'

end
