require 'spec_helper'

describe "poems/show" do
  before(:each) do
    @poem = assign(:poem, stub_model(Poem,
      :venue_id => 1,
      :organization_id => 2,
      :title => "Title",
      :text => "MyText",
      :city => "City",
      :state => "State",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
  end
end
