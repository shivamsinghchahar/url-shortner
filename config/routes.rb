Rails.application.routes.draw do
  root "urls#index"
  get "/:slug" => "urls#decode"
  resources :urls, only: [:index, :update], param: :slug do
    post :encode, on: :collection
    get :decode, on: :member
  end
end
