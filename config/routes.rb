Rails.application.routes.draw do
  post '/' => 'prelaunch#create', :as => :prelaunch
  root :to => 'prelaunch#new'
end
