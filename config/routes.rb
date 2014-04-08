Taskr::Application.routes.draw do
  root to: "lists#index"

  resources :lists, only: [:create, :show] do
    resources :tasks, only: [:new, :create]
  end
end
