Rails.application.routes.draw do
  root "urls#index"
  resources :urls, only: [:index, :update], param: :slug, path: "/" do
    post :encode, on: :collection
    get "/", to: "urls#decode", as: :decode, on: :member
  end
end
