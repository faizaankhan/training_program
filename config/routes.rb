Rails.application.routes.draw do

  resources :users do
    member do
      get :delete
    end
  end

  resources :exams do
    member do
      get :delete
      get :associate
      put :associate_update

    end
  end

  resources :results do
    member do
      get :delete
    end
  end

  resources :questions do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
