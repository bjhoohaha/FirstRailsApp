Rails.application.routes.draw do
  get 'calendar/show'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
    collection do
      delete 'destroy_multiple'
    end
  end

  CalendarExample::Application.routes.draw do
    resource :calendar, only: [:show], controller: :calendar
  end

  root 'welcome#index'
end
