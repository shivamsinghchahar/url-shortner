Rails.application.routes.draw do
  get "/:slug" => "urls#show"
  resources :urls, only: [:create, :show], param: :slug
end
