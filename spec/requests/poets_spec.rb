require 'spec_helper'

describe "Poets" do
  
  subject {page}

  describe "poet_list" do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:poet, first_name: "Jon", last_name: "Sands", email: "jon@example.com", facebook: "iamJonSands")
      FactoryGirl.create(:poet, first_name: "Shira", last_name: "Erlichman", email: "shira@example.com")
    end

    it { should have_title('All poets') }
    it { should have_content('All poets') }

    it "should list each poet" do
      Poet.all.each do |poet|
        expect(page).to have_selector('li', text: poet.first_name)
        expect(page).to have_selector('li', text: poet.last_name)
        expect(page).to have_link(poet.first_name+" "+poet.last_name)
      end 
    end # --- it "should list each poet" do --- 

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

  describe "poet_page" do
    let(:poet) { FactoryGirl.create(:poet, id: 55, first_name: "Jon", last_name: "Sands", email: "jon@example.com", facebook: "iamJonSands") }

    before { visit poet_path(poet) }
    
    it { should have_title(full_title(poet.first_name+' '+poet.last_name)) }
    it { should have_selector('h1', text: "#{poet.first_name} #{poet.last_name}") }
    #it { should have_selector('') } YOUTUBE videos    

  end # --- describe "poet page" do --- 
end
