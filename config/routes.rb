# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# See http://andrewberls.com/blog/post/api-versioning-with-rails-4

Rails.application.routes.draw do

  # TODO: users-staging, users-uat, etc.
  # TODO: Docker doesn't seem to like subdomains
  # constraints subdomain: 'users' do
    namespace :v1 do
      get "/", to: "users#index"
      get "/:id", to: "users#show", constraints: { id: /\d+/ }
      put "/:id", to: "users#update"
      delete "/:id", to: "users#destroy"
      post "/", to: "users#create"
      post "/authenticate", to: "users#authenticate"
      get "/docs", to: "docs#index"
    end
  # end

end
