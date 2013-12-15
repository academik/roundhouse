require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.username) }
    it { should have_title("Roundhouse Poetry | "+user.username) }
  end

  describe "index page" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit poets_path
    end

    it { should have_title('All poets') }
    it { should have_content('All poets') }

    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:poet) } }
      after(:all)  { Poet.delete_all } 

      it { should have_selector('div.pagination') }

      it "should list each poet" do
        Poet.paginate(page:1).each do |poet|
          expect(page).to have_selector('li', text: poet.first_name+" "+poet.last_name)
        end
      end # --- it "should list each poet" do --- 
    end # --- describe "pagination" do --- 
  end #--- describe "index page" do --- 

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username",     with: "Example Username"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end # --- it "should create a user" do --- 

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        
        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link('Sign in') }
        end # --- describe "followed by signout" do ---
      end # --- describe "after saving the user" do --- 
    end # --- describe "with valid information" do
  end # --- describe "signup" do --- 

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Username",         with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }

      specify { expect(user.reload.username).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
      
      #This reloads the user variable from the test database using 
      #user.reload, and then verifies that the user’s new name and 
      #email match the new values.

    end # --- describe "with valid information" do --- 
  end # --- describe "edit" do ---
end # --- describe "User pages" do --- 