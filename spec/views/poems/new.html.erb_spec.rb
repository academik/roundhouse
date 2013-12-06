require 'spec_helper'

describe "poems/new" do
  before(:each) do
    assign(:poem, stub_model(Poem,
      :venue_id => 1,
      :organization_id => 1,
      :title => "MyString",
      :text => "MyText",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new poem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", poems_path, "post" do
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
