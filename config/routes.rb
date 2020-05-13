Rails.application.routes.draw do
  get "/:shortened_url" => "urls#show"
  resource :urls, only: [:create, :show]
end
