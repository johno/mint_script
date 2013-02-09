require 'spec_helper'

describe "scripts/edit" do
  before(:each) do
    @script = assign(:script, stub_model(Script,
      :title => "MyString",
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit script form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scripts_path(@script), :method => "post" do
      assert_select "input#script_title", :name => "script[title]"
      assert_select "input#script_user_id", :name => "script[user_id]"
      assert_select "textarea#script_content", :name => "script[content]"
    end
  end
end
