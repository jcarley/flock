Flock::Application.routes.draw do

  root :to => "timecards#index"
  devise_for :users
  resources :timecards

  match "/nextweek/:id", :to => "timecards#next_week", :as => :next_week
  match "/previousweek/:id", :to => "timecards#previous_week", :as => :previous_week
end
