Rails.application.routes.draw do
  devise_for :users
  resources :course_sections do
    match '/scrape', to: 'course_sections#scrape', via: :post, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'course_sections#index'
end
