Flock::Application.routes.draw do

  root :to => "timecards#index"
  resources :timecards
  devise_for :users

  match "/nextweek/:id", :to => "timecards#next_week", :as => :next_week
  match "/previousweek/:id", :to => "timecards#previous_week", :as => :previous_week
end
