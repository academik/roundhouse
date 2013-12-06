require 'spec_helper'

describe "poems/index" do
  before(:each) do
    assign(:poems, [
      stub_model(Poem,
        :venue_id => 1,
        :organization_id => 2,
        :title => "Title",
        :text => "MyText",
        :city => "City",
        :state => "State",
        :country => "Country"
      ),
      stub_model(Poem,
        :venue_id => 1,
        :organization_id => 2,
        :title => "Title",
        :text => "MyText",
        :city => "City",
        :state => "State",
        :country => "Country"
      )
    ])
  end

  it "renders a list of poems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
