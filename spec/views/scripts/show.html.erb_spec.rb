require 'spec_helper'

describe "scripts/show" do
  before(:each) do
    @script = assign(:script, stub_model(Script,
      :title => "Title",
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
