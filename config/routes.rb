Taskr::Application.routes.draw do
  root to: "dashboards#show"

  resources :lists, only: [:show, :create, :edit, :update] do
    resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:show, :edit, :update]
end
