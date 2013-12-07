require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home Page" do
    before { visit root_path }
    
    it { should have_content('Roundhouse Poetry') } 
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end # --- describe "Home Page" do ---

  describe "About Page" do
    before { visit about_path }

    it { should have_content ('About') }
  	it { should have_title ('Roundhouse Poetry | About') }
  end # --- describe About Page --- 

  describe "Contact Page" do
    before { visit contact_path }
    it { should have_title(full_title('Contact')) }
  end # --- describe "Contact Page" do --- 

  it "should have the right links on the layout" do
    visit root_path
    
    click_link "Poets"
    expect(page).to have_title(full_title('Poets'))

    click_link "Poems"
    expect(page).to have_title(full_title('Poems'))

    click_link "About"
    expect(page).to have_title(full_title('About'))
    
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))

  end




end # --- describe "StaticPages" do --- 
