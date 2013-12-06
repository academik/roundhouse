require 'spec_helper'

describe "poems/edit" do
  before(:each) do
    @poem = assign(:poem, stub_model(Poem,
      :venue_id => 1,
      :organization_id => 1,
      :title => "MyString",
      :text => "MyText",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit poem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", poem_path(@poem), "post" do
      assert_select "input#poem_venue_id[name=?]", "poem[venue_id]"
      assert_select "input#poem_organization_id[name=?]", "poem[organization_id]"
      assert_select "input#poem_title[name=?]", "poem[title]"
      assert_select "textarea#poem_text[name=?]", "poem[text]"
      assert_select "input#poem_city[name=?]", "poem[city]"
      assert_select "input#poem_state[name=?]", "poem[state]"
      assert_select "input#poem_country[name=?]", "poem[country]"
    end
  end
end
