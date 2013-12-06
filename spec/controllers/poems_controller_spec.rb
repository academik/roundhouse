require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PoemsController do

  # This should return the minimal set of attributes required to create a valid
  # Poem. As you add validations to Poem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "venue_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PoemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all poems as @poems" do
      poem = Poem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:poems).should eq([poem])
    end
  end

  describe "GET show" do
    it "assigns the requested poem as @poem" do
      poem = Poem.create! valid_attributes
      get :show, {:id => poem.to_param}, valid_session
      assigns(:poem).should eq(poem)
    end
  end

  describe "GET new" do
    it "assigns a new poem as @poem" do
      get :new, {}, valid_session
      assigns(:poem).should be_a_new(Poem)
    end
  end

  describe "GET edit" do
    it "assigns the requested poem as @poem" do
      poem = Poem.create! valid_attributes
      get :edit, {:id => poem.to_param}, valid_session
      assigns(:poem).should eq(poem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Poem" do
        expect {
          post :create, {:poem => valid_attributes}, valid_session
        }.to change(Poem, :count).by(1)
      end

      it "assigns a newly created poem as @poem" do
        post :create, {:poem => valid_attributes}, valid_session
        assigns(:poem).should be_a(Poem)
        assigns(:poem).should be_persisted
      end

      it "redirects to the created poem" do
        post :create, {:poem => valid_attributes}, valid_session
        response.should redirect_to(Poem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved poem as @poem" do
        # Trigger the behavior that occurs when invalid params are submitted
        Poem.any_instance.stub(:save).and_return(false)
        post :create, {:poem => { "venue_id" => "invalid value" }}, valid_session
        assigns(:poem).should be_a_new(Poem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Poem.any_instance.stub(:save).and_return(false)
        post :create, {:poem => { "venue_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested poem" do
        poem = Poem.create! valid_attributes
        # Assuming there are no other poems in the database, this
        # specifies that the Poem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Poem.any_instance.should_receive(:update).with({ "venue_id" => "1" })
        put :update, {:id => poem.to_param, :poem => { "venue_id" => "1" }}, valid_session
      end

      it "assigns the requested poem as @poem" do
        poem = Poem.create! valid_attributes
        put :update, {:id => poem.to_param, :poem => valid_attributes}, valid_session
        assigns(:poem).should eq(poem)
      end

      it "redirects to the poem" do
        poem = Poem.create! valid_attributes
        put :update, {:id => poem.to_param, :poem => valid_attributes}, valid_session
        response.should redirect_to(poem)
      end
    end

    describe "with invalid params" do
      it "assigns the poem as @poem" do
        poem = Poem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Poem.any_instance.stub(:save).and_return(false)
        put :update, {:id => poem.to_param, :poem => { "venue_id" => "invalid value" }}, valid_session
        assigns(:poem).should eq(poem)
      end

      it "re-renders the 'edit' template" do
        poem = Poem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Poem.any_instance.stub(:save).and_return(false)
        put :update, {:id => poem.to_param, :poem => { "venue_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested poem" do
      poem = Poem.create! valid_attributes
      expect {
        delete :destroy, {:id => poem.to_param}, valid_session
      }.to change(Poem, :count).by(-1)
    end

    it "redirects to the poems list" do
      poem = Poem.create! valid_attributes
      delete :destroy, {:id => poem.to_param}, valid_session
      response.should redirect_to(poems_url)
    end
  end

end
