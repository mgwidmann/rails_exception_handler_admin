require 'spec_helper'

describe "error_messages/edit" do
  before(:each) do
    @post = assign(:error_message, stub_model(RailsExceptionHandler::ActiveRecord::ErrorMessage,
      :title => "MyString",
      :published => false
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_published[name=?]", "post[published]"
    end
  end
end
