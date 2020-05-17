Rails.application.routes.draw do
  root "urls#index"
  get "/:slug" => "urls#show"
  resources :urls, only: [:create, :show, :index], param: :slug
end
