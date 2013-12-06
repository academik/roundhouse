require 'spec_helper'

describe "poets/new" do
  before(:each) do
    assign(:poet, stub_model(Poet,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :website => "MyString",
      :bio => "MyText",
      :facebook => "MyString",
      :twitter => "MyString"
    ).as_new_record)
  end

  it "renders new poet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", poets_path, "post" do
      assert_select "input#poet_first_name[name=?]", "poet[first_name]"
      assert_select "input#poet_last_name[name=?]", "poet[last_name]"
      assert_select "input#poet_email[name=?]", "poet[email]"
      assert_select "input#poet_website[name=?]", "poet[website]"
      assert_select "textarea#poet_bio[name=?]", "poet[bio]"
      assert_select "input#poet_facebook[name=?]", "poet[facebook]"
      assert_select "input#poet_twitter[name=?]", "poet[twitter]"
    end
  end
end
