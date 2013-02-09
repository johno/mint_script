require 'spec_helper'

describe "scripts/index" do
  before(:each) do
    assign(:scripts, [
      stub_model(Script,
        :title => "Title",
        :user_id => 1,
        :content => "MyText"
      ),
      stub_model(Script,
        :title => "Title",
        :user_id => 1,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of scripts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
