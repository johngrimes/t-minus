require "spec_helper"

describe ArticlesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/articles" }.should route_to(:controller => "articles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/articles/new" }.should route_to(:controller => "articles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/articles/1" }.should route_to(:controller => "articles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/articles/1/edit" }.should route_to(:controller => "articles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/articles" }.should route_to(:controller => "articles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/articles/1" }.should route_to(:controller => "articles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/articles/1" }.should route_to(:controller => "articles", :action => "destroy", :id => "1")
    end

  end
end
