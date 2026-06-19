Rails.application.routes.draw do
  # Робимо сторінку index головною
  root 'posts#index'
  
  # Цей рядок автоматично створює маршрути для index, show, new, edit, create, update, destroy
  resources :posts
end