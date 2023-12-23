# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end

Rails.application.routes.draw do
  namespace :api do
    # 使用者註冊路由
    post 'register', to: 'users#register'

    # 留言板路由
    get 'messages', to: 'messages#index'
    get 'messages/:id', to: 'messages#show'
    post 'messages', to: 'messages#create'
    patch 'messages/:id', to: 'messages#update'
    delete 'messages/:id', to: 'messages#destroy'
  end
end