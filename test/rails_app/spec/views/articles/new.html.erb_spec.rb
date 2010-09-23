require 'spec_helper'

describe "articles/new.html.erb" do
  before(:each) do
    assign(:article, stub_model(Article,
      :new_record? => true,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ))
  end

  it "renders new article form" do
    render

    rendered.should have_selector("form", :action => articles_path, :method => "post") do |form|
      form.should have_selector("input#article_title", :name => "article[title]")
      form.should have_selector("textarea#article_body", :name => "article[body]")
      form.should have_selector("input#article_published", :name => "article[published]")
    end
  end
end
