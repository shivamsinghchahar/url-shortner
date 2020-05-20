Rails.application.routes.draw do
  root "urls#index"

  resources :urls, only: [:index, :update], param: :slug do
    post :encode, on: :collection
    put :decode, on: :member
  end
end
