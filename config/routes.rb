Rails.application.routes.draw do
  
  devise_for :users #,:controllers => { :registrations=>"devise/registrations"}
  
  resources :monuments,:categories,:collections,:search,:users,:index,:pictures
  
  devise_scope :user do
    post 'signup'          => 'devise/registrations#create' 
    get 'register'         => 'devise/registrations#new' 
    get 'signup'           => 'devise/registrations#new' 
    get 'login'            => 'devise/sessions#new'    
    get 'signin'           => 'devise/sessions#new'    
    get 'logout'           => 'devise/sessions#destroy'
    get 'exit'             => 'devise/sessions#destroy'
    get 'change-password'  => 'devise/registrations#edit' 
  end
  
  authenticated :user do
     root :to => 'monuments#index'
  end 
    
  get '/' => 'index#index'
  get 'index' => 'index#index'
  get 'collections' => 'collections#index'
  get 'categories'  => 'categories#index'
  get 'monuments'   => 'monuments#index'
  get 'pictures'    => 'pictures#index'
  get 'search'      => 'search#index'
  
  get 'search-category'  => 'search#search_category'
  
end
