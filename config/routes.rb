Rails.application.routes.draw do
  root to: redirect('index.html')
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, :defaults => {:format => 'json'} do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :loads, defaults: {format: :json}
      resources :calibers, defaults: {format: :json}
      resources :users, defaults: {format: :json}, only: [:show]

      resources :traits, defaults: {format: :json} do
        get 'options', :on => :collection
        get 'primers' => 'traits#index', :on => :collection, :defaults => {:type => Trait::TYPE_PRIMER}
        get 'bullets' => 'traits#index', :on => :collection, :defaults => {:type => Trait::TYPE_BULLET}
        get 'powders' => 'traits#index', :on => :collection, :defaults => {:type => Trait::TYPE_POWDER}
      end

      resources :supplies, defaults: {format: :json} do
        get 'products', :on => :collection
        get 'trans_types', :on => :collection

        put 'adjust', :on => :member
      end
    end
  end
end
