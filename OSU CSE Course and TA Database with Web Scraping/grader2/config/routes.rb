Rails.application.routes.draw do
  resources :section_grader_sets
  resources :homes
  resources :evaluations
  resources :recommendations
  resources :grader_applications
  devise_for :users
  resources :course_sections
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  post 'reseed' => 'application#reseed', as: :reseed
end
