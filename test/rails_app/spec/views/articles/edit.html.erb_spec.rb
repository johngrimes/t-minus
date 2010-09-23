require 'spec_helper'

describe "articles/edit.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :new_record? => false,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ))
  end

  it "renders the edit article form" do
    render

    rendered.should have_selector("form", :action => article_path(@article), :method => "post") do |form|
      form.should have_selector("input#article_title", :name => "article[title]")
      form.should have_selector("textarea#article_body", :name => "article[body]")
      form.should have_selector("input#article_published", :name => "article[published]")
    end
  end
end
