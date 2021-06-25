Rails.application.routes.draw do
  root 'surveys#index'
  post 'create' => 'surveys#create'
  get 'result' => 'surveys#result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
