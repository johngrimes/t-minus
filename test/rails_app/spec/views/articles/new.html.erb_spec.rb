require 'spec_helper'

describe "articles/new.html.erb" do
  before(:each) do
    assign(:article, stub_model(Article,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "input#article_title", :name => "article[title]"
      assert_select "textarea#article_body", :name => "article[body]"
      assert_select "input#article_published", :name => "article[published]"
    end
  end
end
