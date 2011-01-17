require 'spec_helper'

describe "articles/edit.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => article_path(@article), :method => "post" do
      assert_select "input#article_title", :name => "article[title]"
      assert_select "textarea#article_body", :name => "article[body]"
      assert_select "input#article_published", :name => "article[published]"
    end
  end
end
