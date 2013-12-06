require 'spec_helper'

describe "poets/show" do
  before(:each) do
    @poet = assign(:poet, stub_model(Poet,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :website => "Website",
      :bio => "MyText",
      :facebook => "Facebook",
      :twitter => "Twitter"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Website/)
    rendered.should match(/MyText/)
    rendered.should match(/Facebook/)
    rendered.should match(/Twitter/)
  end
end
