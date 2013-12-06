require 'spec_helper'

describe "poets/index" do
  before(:each) do
    assign(:poets, [
      stub_model(Poet,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :website => "Website",
        :bio => "MyText",
        :facebook => "Facebook",
        :twitter => "Twitter"
      ),
      stub_model(Poet,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :website => "Website",
        :bio => "MyText",
        :facebook => "Facebook",
        :twitter => "Twitter"
      )
    ])
  end

  it "renders a list of poets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
  end
end
