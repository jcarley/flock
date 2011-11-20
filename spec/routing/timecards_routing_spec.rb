require "spec_helper"

describe TimecardsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/timecards" }.should route_to(:controller => "timecards", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/timecards/new" }.should route_to(:controller => "timecards", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/timecards/1" }.should route_to(:controller => "timecards", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/timecards/1/edit" }.should route_to(:controller => "timecards", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/timecards" }.should route_to(:controller => "timecards", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/timecards/1" }.should route_to(:controller => "timecards", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/timecards/1" }.should route_to(:controller => "timecards", :action => "destroy", :id => "1")
    end

  end
end
