Rails.application.routes.draw do
  root "urls#index"
  resources :urls, only: [:index, :update], param: :slug, path: "/" do
    collection do
      post :encode
      get "/:slug", to: "urls#decode"
    end
    get :decode, on: :member
  end
end
