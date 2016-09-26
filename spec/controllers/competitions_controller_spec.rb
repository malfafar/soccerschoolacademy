require 'rails_helper'

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

RSpec.describe CompetitionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Competition. As you add validations to Competition, be sure to
  # adjust the attributes here as well.
  let!(:season) do
    Season.create(start_year: "2015", end_year: "2016")
  end

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      nr_teams: Faker::Number.number(2),
      knockout: true,
      season_id: season.id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      nr_teams: Faker::Number.number(2),
      knockout: true
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetitionsController. Be sure to keep this updated too.


  describe "GET #index" do

    login_coach

    it "assigns all competitions as @competitions" do
      competition = Competition.create! valid_attributes

      get :index, {}
      expect(assigns(:competitions)).to eq([competition])
    end
  end

  describe "GET #show" do

    login_coach

    it "assigns the requested competition as @competition" do
      competition = Competition.create! valid_attributes
      get :show, {:id => competition.to_param}
      expect(assigns(:competition)).to eq(competition)
    end
  end

  describe "GET #new" do

    login_coach

    it "assigns a new competition as @competition" do
      get :new, {}
      expect(assigns(:competition)).to be_a_new(Competition)
    end
  end

  describe "GET #edit" do

    login_coach

    it "assigns the requested competition as @competition" do
      competition = Competition.create! valid_attributes
      get :edit, {:id => competition.to_param}
      expect(assigns(:competition)).to eq(competition)
    end
  end

  describe "POST #create" do

    login_coach

    context "with valid params" do
      it "creates a new Competition" do
        expect {
          post :create, {:competition => valid_attributes}
        }.to change(Competition, :count).by(1)
      end

      it "assigns a newly created competition as @competition" do
        post :create, {:competition => valid_attributes}
        expect(assigns(:competition)).to be_a(Competition)
        expect(assigns(:competition)).to be_persisted
      end

      it "redirects to the created competition" do
        post :create, {:competition => valid_attributes}
        expect(response).to redirect_to(Competition.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved competition as @competition" do
        post :create, {:competition => invalid_attributes}
        expect(assigns(:competition)).to be_a_new(Competition)
      end

      it "re-renders the 'new' template" do
        post :create, {:competition => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do

    login_coach

    context "with valid params" do
      let(:new_attributes) {
        {
          name: Faker::Name.name,
          nr_teams: Faker::Number.number(2),
          knockout: true
        }
      }

      it "updates the requested competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => new_attributes}
        competition.reload
        expect(competition.name).to eq(new_attributes[:name])
      end

      it "assigns the requested competition as @competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => valid_attributes}
        expect(assigns(:competition)).to eq(competition)
      end

      it "redirects to the competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => valid_attributes}
        expect(response).to redirect_to(competition)
      end
    end

    context "with invalid params" do

      login_coach

      it "assigns the competition as @competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => invalid_attributes}
        expect(assigns(:competition)).to eq(competition)
      end

      it "re-renders the 'edit' template" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    login_coach

    it "destroys the requested competition" do
      competition = Competition.create! valid_attributes
      expect {
        delete :destroy, {:id => competition.to_param}
      }.to change(Competition, :count).by(-1)
    end

    it "redirects to the competitions list" do
      competition = Competition.create! valid_attributes
      delete :destroy, {:id => competition.to_param}
      expect(response).to redirect_to(competitions_url)
    end
  end

end