Rails.application.routes.draw do
  
  resources :plans
  resources :spots
  root "plans#index"
  devise_for :users
  post "/plans/:id/edit" => "plan_spots#create"
  delete "/plans" => "plan_spots#destroy", as: "delete_plan_spot"
  get "plan_spot/new/:plan_id" => "plan_spots#new", as: "new_plan_spots"
  post "plan_spot/new/:plan_id" => "plan_spots#create", as: "create_plan_spots"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
